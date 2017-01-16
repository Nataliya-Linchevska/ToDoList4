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
    static var ref: FIRDatabaseReference!
    
    static func writeToFirebase(task: TaskModel) {
        ref = FIRDatabase.database().reference()
        self.ref.child("tasks").child(task.data.description).setValue(["name": task.name, "data": task.data.description, "checked": task.checked])
    }
    
    static func getTasksFromFirebase(callback: @escaping ()->()) {
        arrayOfTasks.removeAll()
        ref = FIRDatabase.database().reference()
        self.ref.child("tasks").observeSingleEvent(of: .value, with: { (snapshot) in
            for items in snapshot.children {
                let tasksInFirebase = (items as! FIRDataSnapshot).value as! NSDictionary
                let name = tasksInFirebase["name"] as! String
                let checked = tasksInFirebase["checked"] as! Bool
                let data = tasksInFirebase["data"] as! String
                let task = TaskModel(name: name, checked: checked, data: data)
                arrayOfTasks.append(task)
            }
            callback()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    static func deleteTasksFromFirebase(dataForDelete: String) {
        ref = FIRDatabase.database().reference()
        self.ref.child("tasks").child(dataForDelete).removeValue()
    }
}




