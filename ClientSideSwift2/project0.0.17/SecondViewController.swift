//
//  SecondViewController.swift
//  project0.0.17
//
//  Created by Shawn W Nha on 8/1/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    weak var delegate: Delegate?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func submitButton(_ sender: UIButton) {
        delegate?.gobackPressed(by: self, name:name.text, email: email.text)
    }
}
