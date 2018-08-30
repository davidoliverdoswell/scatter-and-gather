//
//  ToDoController.swift
//  PutAndPost
//
//  Created by Lambda-School-Loaner-11 on 8/8/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation

private let baseURL = URL(string: "https://put-and-post.firebaseio.com/")!

class ToDoController {
    
    private(set) var putTodos : [ToDo] = []
    private(set) var postTodos : [ToDo] = []
    
    func createToDo(withTitle title: String, type: ToDoType) -> ToDo {
        let todo = ToDo(title: title)
        switch type {
        case .put:
            putTodos.append(todo)
        case .post:
            postTodos.append(todo)
        }
        return todo
    }
    
    func toggle(isCompleteForToDo todo: ToDo, completion: @escaping (Error?) -> Void) {
        todo.isComplete = !todo.isComplete
        
        push(todo: todo, ofType: .put, completion: completion)
        
    }
    
    func push(todo: ToDo, ofType type: ToDoType, completion: @escaping (Error?) -> Void) {
        
        let path : String
        
        switch type {
        case .put:
            path = "put"
        case .post:
            path = "post"
        }
        
        let url = baseURL
            .appendingPathComponent(path)
            .appendingPathComponent(todo.identifier)
            .appendingPathExtension("json")
        
        var request = URLRequest(url: url)
        
        switch type {
        case .put:
            request.httpMethod = "PUT"
        case .post:
            request.httpMethod = "POST"
        }
        
        do {
            
            request.httpBody = try JSONEncoder().encode(todo)
        } catch {
            NSLog("Unable to encode \(todo) \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error saving data: \(error)")
                completion(error)
                return
            }
            
            completion(nil)
            }.resume()
    }
    
    func fetchToDos(withType type: ToDoType, completion: @escaping (Error?) -> Void) {
        
        let path : String
        switch type {
        case .put:
            path = "put"
        case .post:
            path = "post"
        }
        
        let url = baseURL
            .appendingPathComponent(path)
            .appendingPathExtension("json")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                completion(NSError())
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                
                switch type {
                case .put:
                    let todos = Array(try jsonDecoder.decode([String: ToDo].self, from: data).values)
                   
                    self.putTodos = todos
                
                case .post:
                    let todoDictionaries = try JSONDecoder().decode([String: [String: ToDo]].self, from: data).values
                        let todo = todoDictionaries.flatMap({$0.values})
                    
                    self.postTodos = todo
                }
                
            } catch {
                NSLog("Error: \(error)")
                
            }
            completion(nil)
        }.resume()
    }
}
