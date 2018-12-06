//
//  TodoCell.swift
//  todoList
//
//  Created by Thayllan Anacleto on 2018-12-04.
//  Copyright © 2018 Thayllan Anacleto. All rights reserved.
//

import UIKit

protocol ChangeTaskStatus {
    func changeTaskStatus(checked: Bool, index: Int)
}

class TodoCell: UITableViewCell {
    
    @IBOutlet weak var chkOutlet: UIButton!
    @IBOutlet weak var lblOutlet: UILabel!
    var delegate: ChangeTaskStatus?
    var index: Int?
    var tasks: [Task]?
    
    @IBAction func chkAction(_ sender: Any) {
        
        if tasks![index!].taskStatus {
            delegate?.changeTaskStatus(checked: false, index: index!)
        } else {
            delegate?.changeTaskStatus(checked: true, index: index!)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
