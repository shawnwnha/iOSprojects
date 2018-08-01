//
//  SecondTableViewController.swift
//  project0.0.16
//
//  Created by Shawn W Nha on 7/30/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class SecondTableViewController: UITableViewController {

    var films = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FilmModel.getAllFilms(completionHandler: {
            data, response, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"]{
                        let resultArray = results as! NSArray
                        print(resultArray)
                        for x in resultArray{
                            let y = x as! NSDictionary
                            let z = y["title"] as! String
                            self.films.append(z)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch{
                print(error)
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoCell", for: indexPath)
        cell.textLabel?.text = films[indexPath.row]
        return cell
    }

}
