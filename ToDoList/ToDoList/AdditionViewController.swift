//
//  AdditionViewController.swift
//  ToDoList
//
//  Created by user on 26.12.16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class AdditionViewController: UIViewController, SideBarDelegate {
    
    var sideBar: SideBar = SideBar()
    var index: Int?
    
    @IBOutlet weak var tvEnterInformation: UITextView!
    @IBOutlet weak var switchDone: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if index != nil {
            tvEnterInformation.text = FileHelper.arrayOfTasks[index!].name
            switchDone.setOn(FileHelper.arrayOfTasks[index!].checked, animated: false)
        }
        
        sideBar = SideBar(sourceView: self.view, menuItems: FileHelper.arrayOfItemsSideBar)
        sideBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func switchDoneChange(_ sender: UISwitch) {}
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        
        if index == nil {
            FileHelper.arrayOfTasks.append(TaskModel(name: tvEnterInformation.text, checked: switchDone.isOn))
        } else {
            FileHelper.arrayOfTasks[index!].name = tvEnterInformation.text
            FileHelper.arrayOfTasks[index!].checked = switchDone.isOn
        }
        
        tvEnterInformation.text = ""
        switchDone.isOn = true
    }
    
    func sideBarDidSelectButtonAtIndex(_ index: Int) {
        
        if index == 0 {
            self.navigationController?.popToRootViewController(animated: true)
        } else if index == 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "copyrightView")
            self.navigationController?.pushViewController(controller!, animated: true)
        }
    }
}
