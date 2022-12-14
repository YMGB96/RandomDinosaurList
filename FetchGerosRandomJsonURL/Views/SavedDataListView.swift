//
//  SavedListsView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 09.12.22.
//

import SwiftUI


struct SavedDataListView: View {
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var dinoElements: FetchedResults<Dinos>
    @Environment(\.managedObjectContext) var moc
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dinoElements) { dinoElement in
                    NavigationLink(destination: FetchedDataView(image: dinoElement.image ?? "x.circle.fill",
                                                                title: dinoElement.title ?? "No data", text: dinoElement.text ?? "No data", previousViewWasRandomDataList: false)) {
                        Image(systemName: dinoElement.image ?? "x.circle.fill")
                            .renderingMode(.original)
                            .imageScale(.medium)
                        Text(dinoElement.title ?? "No data")
                            .font(.title)
                            .bold()
                    }
                }
                .onDelete(perform: deleteDinoListEntry)
            }
            .navigationTitle("Saved Dinosaurs")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func deleteDinoListEntry (at offsets: IndexSet) {
        for offset in offsets {
            let list = dinoElements[offset]
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
        SavedDataListView()
            .environment(\.managedObjectContext, context)
    }
}
