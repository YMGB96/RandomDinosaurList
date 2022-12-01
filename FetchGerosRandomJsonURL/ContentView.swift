//
//  ContentView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 24.11.22.
//

import SwiftUI


struct ContentView: View {
    @State private var listCount = 0
    @State private var fetchedDataViews = [FetchedDataView]()
    var body: some View {
        NavigationView {
            List {
                ForEach(fetchedDataViews) { _ in
                    FetchedDataView(id: listCount)
                }
                .onDelete (perform: removeRows)
            }
            .toolbar {
                Text("Random Dinosaurs")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                Button{
                    fetchedDataViews.append(FetchedDataView(id: listCount))
                    listCount += 1
                } label: {
                    Text("Add")
                }
                .padding(.vertical)
                .accessibilityIdentifier("Add Button")
            }
        }
    }
    func removeRows(at offsets: IndexSet) {
        fetchedDataViews.remove(atOffsets: offsets)
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
