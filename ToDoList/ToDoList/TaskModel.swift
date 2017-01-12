//
//  TaskModel.swift
//  ToDoList
//
//  Created by user on 26.12.16.
//  Copyright © 2016 user. All rights reserved.
//

import Foundation

struct TaskModel {
    
    var name: String
    var data: NSDate
    var checked = false
    
    init(name: String, checked: Bool) {
        
        self.name = name
        self.data = NSDate()
        self.checked = checked
        
    }
}
