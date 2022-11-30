//
//  ContentView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 24.11.22.
//

import SwiftUI


struct ContentView: View {
    @State var listCount = 0
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<listCount, id: \.self) {_ in
                    Section(header: Button{ //ugly, cheating, works tho ¯\_(ツ)_/¯
                        print("pressed")                        
                    } label: {
                        Text("Delete")
                    }){
                        FetchedDataView()
                    }
                }
            }
            .toolbar {
                Button{
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
