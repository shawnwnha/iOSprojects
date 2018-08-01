//
//  FirstViewController.swift
//  project0.0.16
//
//  Created by Shawn W Nha on 7/31/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var mass: UILabel!
    
    weak var delegate: Delegate?
    
    var n: String?
    var g: String?
    var b: String?
    var m: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = n
        gender.text = g
        birth.text = b
        mass.text = m
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func gobackClicked(_ sender: UIButton) {
        delegate?.gobackClicked(by: self)
    }
}
