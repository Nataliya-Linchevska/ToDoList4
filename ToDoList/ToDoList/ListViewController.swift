//
//  ListViewController.swift
//  ToDoList
//
//  Created by user on 26.12.16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SideBarDelegate {
    
    var sideBar: SideBar = SideBar()

    @IBOutlet weak var taskList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideBar = SideBar(sourceView: self.view, menuItems: FileHelper.arrayOfItemsSideBar)
        sideBar.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        taskList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Заповнюю к-сть рядків
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FileHelper.arrayOfTasks.count
    }
    
    // Формую ячейку і заповнюю даними
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell")
        let task = FileHelper.arrayOfTasks[indexPath.row]
        cell?.textLabel?.text = task.name
        cell?.detailTextLabel?.text = task.data.description
        if task.checked {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
        return cell!
    }

       
    // Видалення по свайпу
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            FileHelper.arrayOfTasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
            
        }
    }
    
    // Редагування по тапу
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "EditView") as! AdditionViewController
        controller.index = indexPath.row
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @IBAction func btnActionMenu(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Sorted by:", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        // Сортування по назві
        let nameAction = UIAlertAction(title: "Name", style: UIAlertActionStyle.default) {
            (ACTION) in FileHelper.arrayOfTasks.sort(by: { (product1, product2) -> Bool in product1.name < product2.name})
            self.taskList.reloadData()
        }
        
        // Сортування по даті
        let dataAction = UIAlertAction(title: "Data", style: UIAlertActionStyle.default) {
            (ACTION) in FileHelper.arrayOfTasks.sort(by: { (product1, product2) -> Bool in product1.data.timeIntervalSince1970 < product2.data.timeIntervalSince1970 })
            self.taskList.reloadData()
        }
        
        // Відміна
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {(ACTION) in}
        
        alert.addAction(nameAction)
        alert.addAction(dataAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
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
