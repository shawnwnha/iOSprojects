//
//  ViewController.swift
//  project0.0.15
//
//  Created by Shawn W Nha on 7/28/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit
import CoreData

class FirstTableViewController: UITableViewController, DelegateBtoA {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items = [ToDoList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoList")
        do{
            let result = try managedObjectContext.fetch(request)
            items = result as! [ToDoList]
        }catch{
            print("\(error)")
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayCell") as! CellController
        cell.titleLabel.text = items[indexPath.row].ttl
        cell.descriptionLabel.text = items[indexPath.row].desc
        let dayformatter = DateFormatter()
        dayformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if items[indexPath.row].done == true {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        else{
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        cell.datetimeLabel.text = dayformatter.string(from: items[indexPath.row].datetime!)
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! SecondViewController
        secondController.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if items[indexPath.row].done == true {
            print("this is true")
            items[indexPath.row].done = false
        }else{
            items[indexPath.row].done = true
        }
        do{
            try managedObjectContext.save()
        }catch{
            print("\(error)")
        }
        tableView.reloadData()
    }
    
    func AddPressed(by Controller: SecondViewController, ttl Title: String, desc Description:String, dt Datetime: Date) {
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "ToDoList", into: managedObjectContext) as! ToDoList
        item.ttl = Title
        item.desc = Description
        item.datetime = Datetime
        item.done = false
        items.append(item)
        do{
            try managedObjectContext.save()
        }
        catch{
            print("\(error)")
        }
        tableView.reloadData()
        dismiss(animated: false, completion: nil)
    }
}

