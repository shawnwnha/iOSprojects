//
//  ViewController.swift
//  project0.0.11
//
//  Created by Shawn W Nha on 7/26/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, combinedDelegate {
    var BucketList = ["잠순아", "일어나랏", "얼른!!!", "해가 떳다!!!", "사랑해!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("!")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BucketList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoCell", for: indexPath)
        cell.textLabel?.text = BucketList[indexPath.row]
        return cell
    }

    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: indexPath)
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        BucketList.remove(at: indexPath.row)
        tableView.reloadData()
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
            let item = BucketList[indexPath.row]
            secondController.prepopText = item
            secondController.indexPath = indexPath // 2. send indexpath
        }

    }
    
    func cancelButtonPressed(by: SecondTableTableViewController) {
        print("this is fucking first controller working as delegate of second controller: -- Canceled")
        dismiss(animated: false, completion: nil)
    }
    
    func saveButtonPressed(by: SecondTableTableViewController, with text: String, at indexPath:NSIndexPath?){
        if let ip = indexPath{
            BucketList[ip.row] = text
        }else{
            BucketList.append(text)
        }
        tableView.reloadData()
        dismiss(animated: false, completion: nil)
    }
}

