//
//  ViewController.swift
//  project0.0.16
//
//  Created by Shawn W Nha on 7/30/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController, Delegate{
    var people = [String]()
    var gender = [String]()
    var birth = [String]()
    var mass = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PeopleModel.getAllPeople(completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"]{
                        let resultArray = results as! NSArray
                        for x in resultArray{
                            let y = x as! NSDictionary
                            let n = y["name"] as! String
                            let g = y["gender"] as! String
                            let b = y["birth_year"] as! String
                            let m = y["mass"] as! String
                            self.people.append(n)
                            self.gender.append(g)
                            self.birth.append(b)
                            self.mass.append(m)
                        }
                    }
                }
                DispatchQueue.main.async { // async.
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func gobackClicked(by: FirstViewController) {
        dismiss(animated: false, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! FirstViewController
        viewController.delegate = self
        if (sender as? NSIndexPath) != nil {
            let indexPath = sender as! NSIndexPath
            viewController.n = people[indexPath.row]
            viewController.g = gender[indexPath.row]
            viewController.b = birth[indexPath.row]
            viewController.m = mass[indexPath.row]
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoCell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath)
    }
}

