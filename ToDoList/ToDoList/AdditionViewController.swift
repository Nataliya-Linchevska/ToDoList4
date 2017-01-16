//
//  AdditionViewController.swift
//  ToDoList
//
//  Created by user on 26.12.16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit


class AdditionViewController: UIViewController {

    var isNewTask = true
    var task: TaskModel!
    
    @IBOutlet weak var tvEnterInformation: UITextView!
    @IBOutlet weak var switchDone: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isNewTask {
            tvEnterInformation.text = task.name
            switchDone.setOn(task.checked, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func switchDoneChange(_ sender: UISwitch) {}
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        

        if isNewTask {
            FileHelper.writeToFirebase(task: TaskModel(name: tvEnterInformation.text, checked: switchDone.isOn))
        } else {
            task.name = tvEnterInformation.text
            task.checked = switchDone.isOn
            FileHelper.writeToFirebase(task: task)
        }
        
        tvEnterInformation.text = ""
        switchDone.isOn = true
    }    
}
