//
//  FetchedDataView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 25.11.22.
//

import SwiftUI

struct FetchedDataView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    let image: String
    let title: String
    let text: String
    let newList: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: image)
                        .renderingMode(.original)
                        .imageScale(.large)
                    Text(title)
                        .font(.title)
                        .bold()
                 
                }
                Text(text)
                    .multilineTextAlignment(.center)
                    .padding([.top, .leading, .trailing])
            }
            .padding()
            .toolbar {
                if newList {
                    Button (action: {
                        let newList = FetchedDinoList(context: moc)
                        newList.id = UUID()
                        newList.image = image
                        newList.title = title
                        newList.text = text
                        
                        try? moc.save()
                    }, label: {
                        Image(systemName: "square.and.arrow.down.fill")
                            .font(.title)
                    })
                }
            }
        }
    }
}

struct FetchedDataView_Previews: PreviewProvider {
    static var previews: some View {
        
        FetchedDataView(image: "car.fill", title: "Dr. Ian Malcolm", text: "A bunch of dinosaurs", newList: true)
    }
}
