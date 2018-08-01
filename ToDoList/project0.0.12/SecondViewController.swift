//
//  SecondViewController.swift
//  project0.0.12
//
//  Created by Shawn W Nha on 7/26/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {

    weak var delegate: Delegate?
    var prepopulatedText: String?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        let text = textField.text!
        delegate?.addPressed(by: self, with: text, at: indexPath)
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelPressed(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = prepopulatedText
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
