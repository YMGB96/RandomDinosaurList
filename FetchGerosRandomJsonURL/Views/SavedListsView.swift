//
//  SavedListsView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 09.12.22.
//

import SwiftUI


struct SavedListsView: View {
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var dinoLists: FetchedResults<Dinos>
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
    static let dataController: DataController = {
        let retVal = DataController(isInMemory: true)
        let context = retVal.container.viewContext
        for index in 0..<5 {
            let dino = Dinos(context: context)
            dino.id = UUID()
            dino.date = Date()
            dino.title = "Test Dino \(index)"
            dino.text = "Test Dino \(index) example text"
            dino.image = "car.fill"
        }
        return retVal
    }()
    
    static var previews: some View {
        let context = dataController.container.viewContext
        SavedListsView()
            .environment(\.managedObjectContext, context)
    }
}
