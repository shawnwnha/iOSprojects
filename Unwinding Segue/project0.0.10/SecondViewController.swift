//
//  SecondViewController.swift
//  project0.0.10
//
//  Created by Shawn W Nha on 7/25/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text4: UITextField!
    
    @IBAction func submitPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "unwind-VC1", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        let strings = "We are having a fuckin \(text1.text!) time now. Later we will \(text2.text!) and \(text3.text!) in the \(text4.text!)"
        destination.sentText = strings
        print("something Sent")
    }
}

