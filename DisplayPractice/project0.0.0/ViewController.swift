//
//  ViewController.swift
//  project0.0.0
//
//  Created by Shawn W Nha on 7/23/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var top: UILabel!
    @IBOutlet weak var mid: UILabel!
    let quizBank = [("안녕???", "수미야"),("수미야", "사랑해"),("언제나", "사랑해")]
    var count = 0
    
    @IBAction func button1pressed(_ sender: UIButton) {
        if mid.isHidden == true{
            mid.isHidden = false
        }
        else{
            mid.isHidden = true
        }
    }
    @IBAction func button2pressed(_ sender: UIButton) {
        if count < quizBank.count - 1 {
            count += 1
        }
        else{
            count = 0
        }
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateUI(){
        top.text = quizBank[count].0
        mid.text = quizBank[count].1
        mid.isHidden = true
    }
}

