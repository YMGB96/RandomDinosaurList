//
//  ContentView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 24.11.22.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var jsonFetcher = JsonFetcher()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(jsonFetcher.fetchedData) { fetchedData in
                    FetchedDataView(image: fetchedData.image, title: fetchedData.title, text: fetchedData.text)
                }
                .onDelete (perform: removeRows)
            }
            .toolbar {
                Text("Random Dinosaurs")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                Button("Add", action: {
                    jsonFetcher.loadJson()
                })
                .padding(.vertical)
            }
        }
    }
    func removeRows(at offsets: IndexSet) {
        jsonFetcher.fetchedData.remove(atOffsets: offsets)
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
