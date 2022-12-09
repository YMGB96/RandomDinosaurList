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
                    NavigationLink(destination: FetchedDataView(image: fetchedData.image, title: fetchedData.title, text: fetchedData.text)) {
                        Image(systemName: fetchedData.image)
                            .imageScale(.medium)
                            .foregroundColor(.accentColor)
                        Text(fetchedData.title)
                            .font(.title)
                            .bold()
                    }
                }
                .onDelete (perform: removeRows)
                .onMove(perform: move)
            }
            .toolbar {
                if (jsonFetcher.isLoading == true){
                    ProgressView()
                        .padding(.horizontal)
                } else {
                    Button("Add", action: {
                        jsonFetcher.isLoading = true
                        jsonFetcher.loadJson()
                    })
                    
                }
                Text("New Random Lists")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .bold()
                EditButton()
            }
        }
    }
    func removeRows(at offsets: IndexSet) {
        jsonFetcher.fetchedData.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination: Int) {
        jsonFetcher.fetchedData.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct RandomListsView_Previews: PreviewProvider {
    static var previews: some View {
        RandomListsView()
    }
}