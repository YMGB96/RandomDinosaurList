//
//  FetchedDataView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 25.11.22.
//

import SwiftUI

struct FetchedDataView: View {
    
    let image: String
    let title: String
    let text: String
    
    var body: some View {
        VStack{
                VStack {
                    HStack {
                        Image(systemName: image)
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Text(title)
                            .font(.title)
                            .bold()
                    }
                    Text(text)
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading, .trailing])
                }
                .padding()
        }
    }
}

struct FetchedDataView_Previews: PreviewProvider {
    static var previews: some View {
        
        FetchedDataView(image: "sun.fill", title: "Dr. Ian Malcolm", text: "A bunch of dinosaurs")
    }
}
