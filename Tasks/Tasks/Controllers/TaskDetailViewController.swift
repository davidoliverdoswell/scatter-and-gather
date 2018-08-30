//
//  TaskDetailViewController.swift
//  Tasks
//
//  Created by Lambda-School-Loaner-11 on 8/13/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        title = task?.name ?? "Create Task"
        
        nameTextField.text = task?.name
        notesTextView.text = task?.notes
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    
    @IBAction func save(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        
        let notes = notesTextView.text
        
        if let task = task {
            // editing an existing task
            task.name = name
            task.notes = notes
        } else {
            // creating a new task
            let _ = Task(name: name, notes: notes)
        }
        
        do {
            let moc = CoreDataStack.shared.mainContext
            try moc.save()
        } catch {
            NSLog("Error: \(error)")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

}
