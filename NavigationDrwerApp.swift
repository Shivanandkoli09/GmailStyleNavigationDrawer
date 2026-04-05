//
//  NavigationDrwerApp.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

import SwiftUI
import CoreData

@main
struct NavigationDrwerApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
