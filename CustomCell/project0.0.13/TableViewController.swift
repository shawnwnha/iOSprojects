//
//  ViewController.swift
//  project0.0.13
//
//  Created by Shawn W Nha on 7/27/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var nums = [1, 90, 32, 23, 9, 12]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.CellLabel.text = "\(nums[indexPath.row])"
        if nums[indexPath.row] > 24{
            cell.CellLabel.backgroundColor = UIColor .green
        }else{
            cell.CellLabel.backgroundColor = UIColor .red
        }
        return cell
    }
    
}

