//
//  SavedListsView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 09.12.22.
//

import SwiftUI


struct SavedDataListView: View {
    
    enum sortingScheme {
        case dateAsc
        case dateDesc
    }
    
    
    @FetchRequest(sortDescriptors: DataListSort.defaultSort.sortDescriptors) var dinoElements: FetchedResults<Dinos>
    @Environment(\.managedObjectContext) var moc
    @State private var selectedSort = DataListSort.defaultSort
    
    
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
                .onDelete(perform: deleteDinoElement)
                if (dinoElements.count == 0) {
                    Text("""
                        ───────█████─
                        ──────███▄███
                        ──────███████
                        ──────███████
                        ──────████───
                        ──────██████─
                        ─────█████───
                        █───████████─
                        ██─███████─█─
                        ██████████───
                        ██████████───
                        ██████████───
                        ─████████────
                        ──██████─────
                        ───██─██─────
                        ───██──█─────
                        ───█───█─────
                        ───██──██────
                        Are there no dinos good enough for you?
                        """)
                    .font(.caption)
                }
            }
            .navigationTitle("Saved Dinosaurs")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                DataListSortView(selectedSortRule: $selectedSort, sorts: DataListSort.sorts)
                    .onChange(of: selectedSort) { _ in
                        dinoElements.sortDescriptors = selectedSort.sortDescriptors
                    }
            }
            .onDisappear() {
                dinoElements.sortDescriptors = DataListSort.defaultSort.sortDescriptors
            }
        }
    }
    
    func deleteDinoElement (at offsets: IndexSet) {
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
