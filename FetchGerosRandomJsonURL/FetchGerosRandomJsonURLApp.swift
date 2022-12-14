//
//  FetchGerosRandomJsonURLApp.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 24.11.22.
//

import SwiftUI

@main
struct FetchGerosRandomJsonURLApp: App {
    private static var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, Self.dataController.container.viewContext)
        }
    }
}
