//
//  ViewController.swift
//  project0.0.12
//
//  Created by Shawn W Nha on 7/26/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController, Delegate {
    var itemList = ["move","gogo","do it"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 // ------------------------------------------------------ protocol
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    } // how many rows in section
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = itemList[indexPath.row]
        return cell
    } // what would be each rows look like ???
    
//  ------------------------------------------------------
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "addSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        itemList.remove(at: indexPath.row)
        tableView.reloadData()
    }
//  ------------------------------------------------------ segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let secondController = navigationController.topViewController as! SecondViewController
        secondController.delegate = self
        // If sender is a table cell (edit item), additionally pass the item and its location in the table
        if (sender as? NSIndexPath) != nil {
            let indexPath = sender as! NSIndexPath
            secondController.prepopulatedText = itemList[indexPath.row]
            secondController.indexPath = indexPath
        }
    }
    
//  ------------------------------------------------------
    func cancelPressed(by controller: SecondViewController){
        dismiss(animated: false, completion: nil)
    }// dismiss 
    
    func addPressed(by controller: SecondViewController, with text: String, at
        indexPath: NSIndexPath?) {
        
        if let indexPassed = indexPath { // if pressed by edit
            itemList[indexPassed.row] = text
        }
        else{ // if added new
            itemList.append(text)
        }
        tableView.reloadData()
        dismiss(animated: false, completion: nil)
    }
}

