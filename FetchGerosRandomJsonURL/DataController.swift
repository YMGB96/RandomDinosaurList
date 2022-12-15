//
//  DataController.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 05.12.22.
//

import CoreData
import Foundation

class DataController {
    let container = NSPersistentContainer(name: "Dinos")
    
    let bgContext: NSManagedObjectContext
    var viewContext: NSManagedObjectContext { container.viewContext }
    
    init(isInMemory: Bool = false) {
        if isInMemory, let storeDesc = container.persistentStoreDescriptions.first {
            storeDesc.type = NSInMemoryStoreType
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        bgContext = container.newBackgroundContext()
    }
}
