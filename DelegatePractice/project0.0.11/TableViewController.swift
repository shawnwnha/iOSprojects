//
//  ViewController.swift
//  project0.0.11
//
//  Created by Shawn W Nha on 7/26/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, combinedDelegate {
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // setting up core-data context
    
    var items = [BucketListItems]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].textitem!
        return cell
    }

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        managedObjectContext.delete(item)
        do{
            try managedObjectContext.save()
        }
        catch{
            print("\(error)")
        }
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItems") // designate an entity
        do {
            let result = try managedObjectContext.fetch(request) // fetch all data from an entity
            items = result as! [BucketListItems]
        }
        catch {
            print ("\(error)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            let navigationContoller = segue.destination as! UINavigationController
            let secondController = navigationContoller.topViewController as! SecondTableTableViewController
            secondController.delegate = self // assigns this controller to the next controller through delegate
        } else if segue.identifier == "editSegue"{
            let navigationContoller = segue.destination as! UINavigationController
            let secondController = navigationContoller.topViewController as! SecondTableTableViewController
            secondController.delegate = self
            // assigns this controller to the next controller through delegate
            
            let indexPath = sender as! NSIndexPath // get indexpath from tableview above
            let item = items[indexPath.row]
            secondController.prepopText = item.textitem!
            secondController.indexPath = indexPath // send indexpath
        }

    }
    
    func cancelButtonPressed(by: SecondTableTableViewController) {
        print("this is first controller working as delegate of second controller: -- Canceled")
        dismiss(animated: false, completion: nil)
    }
    
    func saveButtonPressed(by: SecondTableTableViewController, with text: String, at indexPath:NSIndexPath?){
        if let ip = indexPath{
            let item = items[ip.row]
            item.textitem = text
        }else{
            // ########################################################
            let item = NSEntityDescription.insertNewObject(forEntityName: "BucketListItems", into: managedObjectContext) as! BucketListItems
            // create a data in entity 
            item.textitem = text
            items.append(item)
        }
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

