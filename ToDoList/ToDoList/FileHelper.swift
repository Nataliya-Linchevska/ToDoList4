//
//  FileHelper.swift
//  ToDoList
//
//  Created by user on 26.12.16.
//  Copyright © 2016 user. All rights reserved.
//

import Foundation
import Firebase

class FileHelper {
    
    static var arrayOfTasks = [TaskModel]()
    static var arrayOfItemsSideBar = ["List", "Information"]
    
    static var ref: FIRDatabaseReference!
    
    static func writeToFirebase(task: TaskModel) {
        ref = FIRDatabase.database().reference()
        self.ref.child("tasks").child(task.name).setValue(["data": task.data.description, "checked": task.checked])
    }

}
