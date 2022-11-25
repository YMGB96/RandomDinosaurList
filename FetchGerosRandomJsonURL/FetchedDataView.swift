//
//  FetchedDataView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 25.11.22.
//

import SwiftUI

struct FetchedDataView: View {
    @State var image = "leaf.fill"
    @State var title = "Label goes here"
    @State var text = "text goes here"
    @State var minWordCount = 0
    @State var maxWordCount = 0
    var body: some View {
        VStack{
            Button {
                loadJson(urlString: "https://codingfromhell.net/swiftDemo/listElement/listElement?responseDelay=500&minWordCount=10&maxWordCount=10") { result in
                    switch result {
                    case .success(let data):
                        let decodedData = parseJson(jsonData: data)
                        image = decodedData.icon
                        title = decodedData.label
                        text = decodedData.text
                        minWordCount = decodedData.minWordCount
                        maxWordCount = decodedData.maxWordCount
                    case .failure(let error):
                        print(error)
                    }
                }
            } label: {
                Text("Fetch Json")
                    .multilineTextAlignment(.center)
            }
            VStack {
                HStack {
                    Image(systemName: image)
                        .imageScale(.large)
                    Text(title)
                        .font(.title)
                }
                Text(text)
                Text("min \(minWordCount) Words")
                Text("max \(maxWordCount) Words")
            }
            .padding()
        }
    }
}

struct FetchedDataView_Previews: PreviewProvider {
    static var previews: some View {
        FetchedDataView()
    }
}
