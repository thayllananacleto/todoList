//
//  ViewController.swift
//  todoList
//
//  Created by Thayllan Anacleto on 2018-11-29.
//  Copyright © 2018 Thayllan Anacleto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewTask, ChangeTaskStatus {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Determines how many rows it's gonna show in the Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // Manipulate rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TodoCell
        cell.lblOutlet.text = tasks[indexPath.row].taskName
        
        if tasks[indexPath.row].taskStatus {
            cell.chkOutlet.setBackgroundImage(#imageLiteral(resourceName: "checked-checkbox"), for: UIControl.State.normal)
        } else {
            cell.chkOutlet.setBackgroundImage(#imageLiteral(resourceName: "unchecked-checkbox"), for: UIControl.State.normal)
        }
        
        cell.delegate = self
        cell.index = indexPath.row
        cell.tasks = tasks
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! NewTaskController
        viewController.delegate = self
    }
    
    func newTask(taskName: String) {
        tasks.append(Task(taskName: taskName))
        tableView.reloadData()
    }
    
    func changeTaskStatus(checked: Bool, index: Int) {
        tasks[index].taskStatus = checked
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
    }

}

class Task {
    var taskName = ""
    var taskStatus = false
    
    convenience init(taskName: String) {
        self.init()
        self.taskName = taskName
    }
}
