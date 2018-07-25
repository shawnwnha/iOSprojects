//
//  ViewController.swift
//  project0.0.2
//
//  Created by Shawn W Nha on 7/24/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var guess = String(arc4random_uniform(100)+1)
    @IBOutlet weak var tfield: UITextField!
    @IBAction func button1(_ sender: UIButton) {
        
        if tfield.text! == guess{
            print("correct")
        }
        else if tfield.text! < guess{
            print("smaller")
        }
        else{
            print("bigger")
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

