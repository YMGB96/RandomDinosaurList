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
    
//    var ohShit = [FetchedDinoList?]()
//
//    func exampleStuff() {
//        // assume we call exampleStuff FROM the main thread (or main queue)
//        bgContext.perform { [self] in
//            let newObject = FetchedDinoList(context: bgContext)
//            // ... assume this takes 5 seconds
//            try? bgContext.save()
//        }
//
//        exampleStuff2 { results in
//            print(results)
//        }
//
//        Task { @MainActor in
//            let myIds = try await exampleStuff3()
//            print(myIds)
//        }
//    }
//
//    func exampleStuff2(block: @escaping ([NSManagedObjectID]) -> Void) {
//        bgContext.perform { [self] in
//            let someFetch = FetchedDinoList.fetchRequest()
//            someFetch.predicate = NSPredicate(format: "\(#keyPath(FetchedDinoList.image)) == %@",
//                                              "car.fill")
//            let matching = (try? bgContext.fetch(someFetch)) ?? []
//            let correct = matching.map { $0.objectID }
//            // now it works
//            DispatchQueue.main.async { block(correct) }
//        }
//    }
//
//    func exampleStuff3() async throws -> [NSManagedObjectID] {
//        print("something")
//        let retVal = try await bgContext.perform { [self] in
//            let someFetch = FetchedDinoList.fetchRequest()
//            someFetch.predicate = NSPredicate(format: "\(#keyPath(FetchedDinoList.image)) == %@",
//                                              "car.fill")
//            let matching = try bgContext.fetch(someFetch)
//            return matching.map { $0.objectID }
//        }
//        print("done")
//        return retVal
//    }
}
