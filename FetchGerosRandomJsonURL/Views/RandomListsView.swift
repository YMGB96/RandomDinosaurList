//
//  RandomListsView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 09.12.22.
//

import SwiftUI

struct RandomListsView: View {
    
    @StateObject var jsonFetcher = JsonFetcher()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(jsonFetcher.fetchedData) { fetchedData in
                    NavigationLink(destination: FetchedDataView(image: fetchedData.image,
                                                                title: fetchedData.title, text: fetchedData.text, newList: true)) {
                        Image(systemName: fetchedData.image)
                            .renderingMode(.original)
                            .imageScale(.medium)
                        Text(fetchedData.title)
                            .font(.title)
                            .bold()
                    }
                }
                .onDelete (perform: removeRows)
            }
            .navigationTitle("New Random Lists")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if (jsonFetcher.isLoading == true){
                    ProgressView()
                } else {
                    Button(action: {
                        jsonFetcher.loadJson()
                    }, label: {
                        Image(systemName: "plus.app.fill")
                    })
                    
                }
            }
        }
    }
    func removeRows(at offsets: IndexSet) {
        jsonFetcher.fetchedData.remove(atOffsets: offsets)
    }
}

struct RandomListsView_Previews: PreviewProvider {
    static var previews: some View {
        RandomListsView()
    }
}
