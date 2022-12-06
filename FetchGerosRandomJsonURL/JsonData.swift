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
