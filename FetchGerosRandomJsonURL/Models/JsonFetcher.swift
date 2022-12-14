//
//  JsonFetcher.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 05.12.22.
//

import Foundation

class JsonFetcher: ObservableObject {
    
    @Published var fetchedData = [FetchedDataElement]()
    @Published var isLoading = false
    
    func loadJson(){
        isLoading = true
        load(url: semiRandomURLConstructor()) { result in
            defer {
                self.isLoading = false
            }
            switch result {
            case .success(let data):
                self.fetchedData.append(FetchedDataElement(image: data.icon, title: data.label, text: data.text))
            case .failure(let error):
                print(error)
            }
        }
        
        func load(url: URL, completion: @escaping (Result<JsonData, Error>) -> Void) {
            let urlTask = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async { completion(.failure(error)) }
                    return
                }
                guard let data = data, let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    DispatchQueue.main.async { completion(.failure(ResponseError.badStatusCode)) }
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
        
        func semiRandomURLConstructor() -> URL {
            let responseDelay = Int.random(in: 200...2000)
            let minWordCount = Int.random(in: 10...30)
            let maxWordCount = Int.random(in: minWordCount..<(minWordCount + 30))
            
            var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "codingfromhell.net"
            urlComponents.path = "/swiftDemo/listElement/listElement"
            
            urlComponents.queryItems = [ URLQueryItem(name: "responseDelay", value: String(responseDelay)),
                                         URLQueryItem(name: "minWordCount", value: String(minWordCount)),
                                         URLQueryItem(name: "maxWordCount", value: String(maxWordCount))
            ]
            let url = urlComponents.url
            return url!
        }
    }
    enum ResponseError: Error {
        case badStatusCode
    }
}

extension JsonFetcher {
    
    struct FetchedDataElement: Identifiable { 
        let id = UUID()
        let image: String
        let title: String
        let text: String
    }
    
}
