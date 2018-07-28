//
//  ViewController.swift
//  project0.0.14
//
//  Created by Shawn W Nha on 7/27/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Delegate {
    var sum: Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalSum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        totalSum.text = String(sum)
        print(sum)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func minusPressed(by indexPath: NSIndexPath?) {
        if let index = indexPath {
            let num = NSDecimalNumber(decimal: pow(2, index.row)).int32Value
            sum = sum - Int(num)
            totalSum.text = String(sum)
        }
    }
    func plusPressed(by indexPath: NSIndexPath?) {
        if let index = indexPath {
            let num = NSDecimalNumber(decimal: pow(2, index.row)).int32Value
            sum = sum + Int(num)
            totalSum.text = String(sum)
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProtoCell") as! Cells
        let digit = pow(10,indexPath.row)
        
        cell.digitLabel.text = digit.description
        cell.delegate = self
        cell.indexPath = indexPath as NSIndexPath
        return cell
    }
}
