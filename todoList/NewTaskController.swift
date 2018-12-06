//
//  NewTaskController.swift
//  todoList
//
//  Created by Thayllan Anacleto on 2018-12-04.
//  Copyright © 2018 Thayllan Anacleto. All rights reserved.
//

import UIKit

protocol NewTask {
    func newTask(taskName: String)
}

// Controller responsible for the create tasks screen
class NewTaskController: UIViewController {

    @IBOutlet weak var taskNameOutlet: UITextField!
    var delegate: NewTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Create a new task when the user clicks on the button
    @IBAction func createTask(_ sender: Any) {
        
        if taskNameOutlet.text != "" {
            delegate?.newTask(taskName: taskNameOutlet.text!)
            navigationController?.popViewController(animated: true)
        }
        
    }

}
