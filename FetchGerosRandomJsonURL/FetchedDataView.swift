//
//  FetchedDataView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 25.11.22.
//

import SwiftUI

struct FetchedDataView: Identifiable, View {
    var id: Int
    @State var image = "leaf.fill"
    @State var title = "Label goes here"
    @State var text = "text goes here"
    @State var didAppear = false
    var body: some View {
        VStack{
            if (title != "Label goes here"){
                VStack {
                    HStack {
                        Image(systemName: image)
                            .imageScale(.large)
                        Text(title)
                            .font(.title)
                    }
                    Text(text)
                }
                .padding()
            }
        }
        .onAppear() {
            if (didAppear == false){
                JsonData.loadJson(urlString: "https://codingfromhell.net/swiftDemo/listElement/listElement?responseDelay=500&minWordCount=10&maxWordCount=10") { result in
                    switch result {
                    case .success(let data):
                        image = data.icon
                        title = data.label
                        text = data.text
                        didAppear = true
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}

struct FetchedDataView_Previews: PreviewProvider {
    static var previews: some View {
        FetchedDataView(id: 1)
    }
}
