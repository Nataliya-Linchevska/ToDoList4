//
//  AdditionViewController.swift
//  ToDoList
//
//  Created by user on 26.12.16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit


class AdditionViewController: UIViewController {

    var index: Int?
    
    @IBOutlet weak var tvEnterInformation: UITextView!
    @IBOutlet weak var switchDone: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if index != nil {
            tvEnterInformation.text = FileHelper.arrayOfTasks[index!].name
            switchDone.setOn(FileHelper.arrayOfTasks[index!].checked, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func switchDoneChange(_ sender: UISwitch) {}
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        
        FileHelper.writeToFirebase(task: TaskModel(name: tvEnterInformation.text, checked: switchDone.isOn))
//        if index == nil {
//            FileHelper.arrayOfTasks.append(TaskModel(name: tvEnterInformation.text, checked: switchDone.isOn))
//        } else {
//            FileHelper.arrayOfTasks[index!].name = tvEnterInformation.text
//            FileHelper.arrayOfTasks[index!].checked = switchDone.isOn
//        }
        
        tvEnterInformation.text = ""
        switchDone.isOn = true
    }    
}
