//
//  ToDoListTableViewController.swift
//  PutAndPost
//
//  Created by Lambda-School-Loaner-11 on 8/8/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var todoType : ToDoType = .put
    
    var todos : [ToDo] {
        switch todoType {
        case .put:
            return todoController.putTodos
        case .post:
            return todoController.postTodos
        }
    }
    
    var todoController = ToDoController()
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func create(_ sender: Any) {
        
        guard let title = textField.text else { return }
        
        let todo = todoController.createToDo(withTitle: title, type: todoType)
        
        todoController.push(todo: todo, ofType: todoType) { (error) in
            if let error = error {
                NSLog("Error \(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func todo(indexPath: IndexPath) -> ToDo {
        let filteredTodos : [ToDo]
        
        if indexPath.section == 0 {
            filteredTodos = todos.filter({$0.isComplete})
        } else {
            filteredTodos = todos.filter({!$0.isComplete})
        }
        
        return filteredTodos[indexPath.row]
    }

    private func fetchToDos() {
        todoController.fetchToDos(withType: todoType) { (error) in
            if let error = error {
                NSLog("Error: \(error)")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchToDos()
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let aTodo = todo(indexPath: indexPath)
        
        let title: String
        
        switch todoType {
        case .put:
            title = "PUT again"
        case .post:
            title = "POST again"
        }
        
        
        let againAction = UIContextualAction(style: .normal, title: title) { (action, view, handler) in
            
            self.todoController.push(todo: aTodo, ofType: self.todoType, completion: { (error) in
                if let error = error {
                    NSLog("Error pushing todo to server again \(error)")
                    return
                }
                
                self.fetchToDos()
                DispatchQueue.main.async {
                    handler(true)
                }
            })
        }
        
        let isCompleteTitle = aTodo.isComplete ? "incomplete" : "completed"
        
        let updatedCompletedAction = UIContextualAction(style: .normal, title: "Mark \(isCompleteTitle)") { (acion, view, handler) in
            
            self.todoController.toggle(isCompleteForToDo: aTodo, completion: { (error) in
                if let error = error {
                    NSLog("Error: \(error)")
                }
                
                self.fetchToDos()
                DispatchQueue.main.async {
                    handler(true)
                }
            })
        }
        
        againAction.backgroundColor = .red
        updatedCompletedAction.backgroundColor = .blue
        
        return UISwipeActionsConfiguration(actions: [againAction, updatedCompletedAction])
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Completed To Dos"
        } else {
            return "Incompleted To Dos"
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return todos.filter({$0.isComplete}).count
        } else {
            return todos.filter({!$0.isComplete}).count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        
        let aTodo = todo(indexPath: indexPath)
        
        cell.textLabel?.text = aTodo.title

        return cell
    }
}
