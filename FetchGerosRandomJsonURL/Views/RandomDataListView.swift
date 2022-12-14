//
//  RandomListsView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 09.12.22.
//

import SwiftUI

struct RandomDataListView: View {
    
    @StateObject var jsonFetcher = JsonFetcher()
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(jsonFetcher.fetchedData) { fetchedData in
                    NavigationLink(destination: FetchedDataView(image: fetchedData.image,
                                                                title: fetchedData.title, text: fetchedData.text, previousViewWasRandomDataList: true)) {
                        Image(systemName: fetchedData.image)
                            .renderingMode(.original)
                            .imageScale(.medium)
                        Text(fetchedData.title)
                            .font(.title)
                            .bold()
                    }
                }
                .onDelete (perform: removeRows)
                if (jsonFetcher.fetchedData.count == 0) {
                    Text("""
                        ───────█████─
                        ──────███▄███
                        ──────███████
                        ──────███████
                        ──────████───
                        ──────██████─
                        ─────█████───
                        █───████████─
                        ██─███████─█─
                        ██████████───
                        ██████████───
                        ██████████───
                        ─████████────
                        ──██████─────
                        ───██─██─────
                        ───██──█─────
                        ───█───█─────
                        ───██──██────
                        Please, I need friends...
                        """)
                    .font(.caption)
                }
            }
            .navigationTitle("New Random Dinosaurs")
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
    static let dataController = SavedListsView_Previews.dataController
    
    static var previews: some View {
        RandomDataListView()
            .environment(\.managedObjectContext,
                          dataController.container.viewContext)
    }
}
