//
//  ToDo.swift
//  PutAndPost
//
//  Created by Lambda-School-Loaner-11 on 8/8/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation

enum ToDoType {
    case put
    case post
}

class ToDo: Codable {
    
    let title: String
    let identifier: String
    var isComplete: Bool
    
    init(title: String, identifier: String = UUID().uuidString, isComplete: Bool = false) {
        
        self.title = title
        self.identifier = identifier
        self.isComplete = isComplete
    }
}
