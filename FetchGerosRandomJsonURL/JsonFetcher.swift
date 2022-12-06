//
//  JsonFetcher.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 05.12.22.
//

import Foundation

class JsonFetcher: ObservableObject {
    
    @Published var fetchedData = [FetchedDataFile]()
    
    func loadJson(){
        load(urlString: "https://codingfromhell.net/swiftDemo/listElement/listElement?responseDelay=500&minWordCount=10&maxWordCount=10") { result in
            switch result {
            case .success(let data):
                self.fetchedData.append(FetchedDataFile(image: data.icon, title: data.label, text: data.text))
            case .failure(let error):
                print(error)
            }
        }
        
        func load(urlString: String, completion: @escaping (Result<JsonData, Error>) -> Void) {
            if let url = URL(string: urlString) {
                let urlTask = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        DispatchQueue.main.async { completion(.failure(error)) }
                    }
                    guard let data = data, let httpResponse = response as? HTTPURLResponse,
                          httpResponse.statusCode == 200 else {
                        DispatchQueue.main.async { completion(.failure(error!)) }
                        return
                    }
                    do {
                        let decodedData = try JSONDecoder().decode(JsonData.self, from: data)
                        DispatchQueue.main.async { completion(.success(decodedData)) }
                    } catch {
                        DispatchQueue.main.async { completion(.failure(error)) }
                    }
                }
                urlTask.resume()
            }
        }
    }
}

extension JsonFetcher {
    
    struct FetchedDataFile: Identifiable {
        let id = UUID()
        let image: String
        let title: String
        let text: String
    }
    
}
