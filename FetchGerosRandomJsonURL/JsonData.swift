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
}


func loadJson(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
    if let url = URL(string: urlString) {
        let urlTask = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            }
        }
        urlTask.resume()
    }
}

func parseJson(jsonData: Data) -> JsonData {
    let decodedData = try! JSONDecoder().decode(JsonData.self, from: jsonData)
    print(decodedData.icon)
    print(decodedData.label)
    print(decodedData.text)
    print(decodedData.minWordCount)
    print(decodedData.maxWordCount)
    return decodedData
}

