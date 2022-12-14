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
            List{
                NavigationLink("Get new lists", destination: RandomListsView())
                    .font(.title)
                    .bold()
                NavigationLink("Your saved lists", destination: SavedListsView())
                    .font(.title)
                    .bold()
            }
            .toolbar {
                Text("Random Dinosaurs")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .bold()
                    .padding(.horizontal, 55.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
