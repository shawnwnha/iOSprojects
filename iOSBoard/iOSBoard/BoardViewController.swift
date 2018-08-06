//
//  ViewController.swift
//  iOSBoard
//
//  Created by Shawn W Nha on 8/3/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit
import CoreData

class BoardViewController: UITableViewController, PostingViewDelegte {
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // setting up core-data context
    
    var items = [BoardItems]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchAll(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BoardItems")
        // designate an entity
        do {
            let result = try managedObjectContext.fetch(request)
            items = result as! [BoardItems]
        }
        catch {
            print ("\(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! BoardCell
        cell.ttl.text = items[indexPath.row].ttl
        cell.desc.text = items[indexPath.row].desc
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        performSegue(withIdentifier: "SegueToPosting", sender: indexPath)
//    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let destinationController = navigationController.topViewController as! PostingViewController
        destinationController.delegate = self
    }
    func dismissPressed(by controller: PostingViewController) {
        dismiss(animated: false, completion: nil)
    }
    func savePressed(by controller: PostingViewController, input1 ttl:String?, input2 desc:String?, at indexPath: NSIndexPath?){
        if let ip = indexPath{
            let item = items[ip.row]
            item.ttl = ttl
            item.desc = desc
        }else{
            // ########################################################
            let item = NSEntityDescription.insertNewObject(forEntityName: "BoardItems", into: managedObjectContext) as! BoardItems
            // create a data in entity
            item.ttl = ttl
            item.desc = desc
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


