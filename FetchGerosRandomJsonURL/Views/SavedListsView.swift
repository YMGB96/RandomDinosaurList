//
//  SavedListsView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 09.12.22.
//

import SwiftUI


struct SavedListsView: View {
    
    @FetchRequest(sortDescriptors: []) var dinoLists: FetchedResults<FetchedDinoList> //nach UUID sinnvoll?
    @Environment(\.managedObjectContext) var moc
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dinoLists) { dinolist in
                    NavigationLink(destination: FetchedDataView(image: dinolist.image ?? "x.circle.fill",
                                                                title: dinolist.title ?? "No data", text: dinolist.text ?? "No data", newList: false)) {
                        Image(systemName: dinolist.image ?? "x.circle.fill")
                            .renderingMode(.original)
                            .imageScale(.medium)
                        Text(dinolist.title ?? "No data")
                            .font(.title)
                            .bold()
                    }
                }
                .onDelete(perform: deleteDinoList)
                .onMove(perform: nil)
            }
            .navigationTitle("Saved Lists")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    func deleteDinoList (at offsets: IndexSet) {
        for offset in offsets {
            let list = dinoLists[offset]
            moc.delete(list)
        }
        try? moc.save()
    }
}

struct SavedListsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedListsView()
    }
}
