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
    var body: some View {
        VStack{
            if (title != "Label goes here"){
                HStack {
                    Image(systemName: image)
                        .imageScale(.large)
                    Text(title)
                        .font(.title)
                }
            }
        }
        .onAppear() {
            JsonData.loadJson(urlString: "https://codingfromhell.net/swiftDemo/listElement/listElement?responseDelay=500&minWordCount=10&maxWordCount=10") { result in
                switch result {
                case .success(let data):
                    image = data.icon
                    title = data.label
                    text = data.text
                case .failure(let error):
                    print(error)
                }
            }
        }
        if (title != "Label goes here") {
            VStack {
                Text(text)
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
