//
//  ViewController.swift
//  project0.0.17
//
//  Created by Shawn W Nha on 8/1/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit
import CoreData

class FirstTableViewController: UITableViewController, Delegate {
    
    var items = [User]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! SecondViewController
        destination.delegate = self
    }
    
    func fetchAll(){
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            let resultsTemp = try managedObjectContext.fetch(itemRequest)
            let results = resultsTemp as! [User]
            for result in results{
                items.append(result)
            }
        }catch{
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fvCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
    
    func gobackPressed(by controller: SecondViewController, name: String?, email: String?) {
        let thing = NSEntityDescription.insertNewObject(forEntityName: "User", into: managedObjectContext) as! User
        thing.name = name!
        thing.email = email!
        items.append(thing)
        do {
            try managedObjectContext.save()
            print("Success")
        } catch {
            print(error)
        }
        tableView.reloadData()
        dismiss(animated: false, completion: nil)
    }
}

