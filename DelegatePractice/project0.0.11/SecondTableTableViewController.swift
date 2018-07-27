//
//  SecondTableTableViewController.swift
//  project0.0.11
//
//  Created by Shawn W Nha on 7/26/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class SecondTableTableViewController: UITableViewController {

    weak var delegate: combinedDelegate?
    
    var prepopText: String?
    var indexPath: NSIndexPath? // 1. ready to pass indexpath
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        print("Canceled")
        delegate?.cancelButtonPressed(by: self)
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let textData = textField.text!
        print("Saved")
        delegate?.saveButtonPressed(by: self, with: textData, at: indexPath)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = prepopText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }

}

