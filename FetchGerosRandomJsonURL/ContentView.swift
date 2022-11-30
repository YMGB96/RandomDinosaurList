//
//  ContentView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 24.11.22.
//

import SwiftUI


struct ContentView: View {
    @State private var fetchedDataIsShown = false
    @State var fetchedImage = "leaf.fill"
    @State var listCount = 0
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<listCount, id: \.self) {_ in
                    FetchedDataView()
//                if (fetchedDataIsShown == true) {
//                    FetchedDataView()
                }
            }
            .toolbar {
                Button{
//                    fetchedDataIsShown.toggle()
                    listCount += 1
                } label: {
                    Text("Add")
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
