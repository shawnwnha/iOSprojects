//
//  ViewController.swift
//  project0.0.1
//
//  Created by Shawn W Nha on 7/24/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var top: UILabel!
    @IBOutlet weak var mid: UILabel!
    let listBank = ["Whois", "Handsome","Young", "Rich", "GOOD"]
    
    
    @IBAction func button1(_ sender: UIButton) {
        if top.isHidden == true{
            top.isHidden = false
        }
        else{
            top.isHidden = true
        }
    }
    var count = 0
    @IBAction func button2(_ sender: UIButton) {
        mid.text = String(arc4random_uniform(6))
        if mid.text == "1"{
            mid.textColor = UIColor.red
        }
        else if mid.text == "2"{
            mid.textColor = UIColor.blue
        }
        else if mid.text == "3"{
            mid.textColor = UIColor.green
        }
        else if mid.text == "4"{
            mid.textColor = UIColor.brown
        }
        else{
            mid.textColor = UIColor.cyan
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

