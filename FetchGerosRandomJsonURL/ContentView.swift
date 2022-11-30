//
//  ContentView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 24.11.22.
//

import SwiftUI


struct ContentView: View {
    @State var listCount = 0
    @State private var fetchedDataViews = [FetchedDataView]()
    var body: some View {
        NavigationView {
            List {
                ForEach(fetchedDataViews) {_ in 
                    FetchedDataView(id: listCount)
                }
                .onDelete (perform: removeRows)
            }
            .toolbar {
                Button{
                    fetchedDataViews.append(FetchedDataView(id: listCount))
                    listCount += 1
                } label: {
                    Text("Add")
                }
            }
        }
    }
    func removeRows(at offsets: IndexSet) {
        print("deleted")
        fetchedDataViews.remove(atOffsets: offsets)
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
