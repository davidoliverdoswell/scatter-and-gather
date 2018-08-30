//
//  CoreDataStack.swift
//  Tasks
//
//  Created by Lambda-School-Loaner-11 on 8/13/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Tasks")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Error \(error)")
            }
        })
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
