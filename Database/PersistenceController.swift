//
//  PersistentController.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

import Foundation
import CoreData


struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MatchesDB")

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("❌ Core Data failed: \(error)")
            }
        }

        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
