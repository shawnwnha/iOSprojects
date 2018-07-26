//
//  ViewController.swift
//  project0.0.10
//
//  Created by Shawn W Nha on 7/25/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sentText:String?
    @IBOutlet weak var textArea: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindtoVC1(segue:UIStoryboardSegue){
        textArea.text = sentText
    }

}

