//
//  SecondViewController.swift
//  project0.0.15
//
//  Created by Shawn W Nha on 7/28/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var delegate: DelegateBtoA?
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datetimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddPressed(_ sender: UIButton) {
        if let x = titleTextField.text, let y = descriptionTextField.text {
            delegate?.AddPressed(by: self, ttl: x, desc: y, dt: datetimePicker.date)
        }
    }
}
