//
//  TaskTableViewController.swift
//  Tasks
//
//  Created by Lambda-School-Loaner-11 on 8/13/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit
import CoreData

class TaskTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)

        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            let moc = CoreDataStack.shared.mainContext
            moc.delete(task)
            
            do {
                try moc.save()
            } catch {
                moc.reset()
            }
            
            tableView.reloadData()
        }
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowTaskDetail" {
            let detailVC = segue.destination as! TaskDetailViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                detailVC.task = tasks[indexPath.row]
            }
        }
    }
    

    var tasks: [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        let moc = CoreDataStack.shared.mainContext
        
        do {
            return try moc.fetch(fetchRequest)
        } catch {
            NSLog("Error: \(error)")
            return []
        }
    }
}
