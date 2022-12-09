//
//  FetchGerosRandomJsonURLApp.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 24.11.22.
//

import SwiftUI

@main
struct FetchGerosRandomJsonURLApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
