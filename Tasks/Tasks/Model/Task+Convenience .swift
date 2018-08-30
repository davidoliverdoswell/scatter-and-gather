//
//  Task+Convenience .swift
//  Tasks
//
//  Created by Lambda-School-Loaner-11 on 8/13/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    convenience init(name: String, notes: String? = nil, managedObjectContect: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: managedObjectContect)
        
        self.name = name
        self.notes = notes
    }
}
