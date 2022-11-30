//
//  JsonData.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 24.11.22.
//

import Foundation

struct JsonData: Codable {
    let icon: String
    let label: String
    let text: String
    let minWordCount: Int
    let maxWordCount: Int
    
    
    
    static func loadJson(urlString: String, completion: @escaping (Result<JsonData, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlTask = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data, let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    completion(.failure(error!))
                    return
                }
                DispatchQueue.main.async {
                    do {
                        let decodedData = try JSONDecoder().decode(JsonData.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(error))
                    }
                }
                
            }
            urlTask.resume()
        }
    }
}
