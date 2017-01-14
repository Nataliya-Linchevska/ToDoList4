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
    
    init(name: String, checked: Bool, data: String) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z" 
        print(dateFormatter.date(from: data))
        self.data = dateFormatter.date(from: data) as! NSDate

        self.name = name
        self.checked = checked
    }

}
