//
//  ViewController.swift
//  project0.0.3
//
//  Created by Shawn W Nha on 7/24/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cost: UILabel!
    
    @IBOutlet weak var percent1: UILabel!
    @IBOutlet weak var tAmount1: UILabel!
    @IBOutlet weak var tTotal1: UILabel!
    
    @IBOutlet weak var percent2: UILabel!
    @IBOutlet weak var tAmount2: UILabel!
    @IBOutlet weak var tTotal2: UILabel!
    
    @IBOutlet weak var percent3: UILabel!
    @IBOutlet weak var tAmount3: UILabel!
    @IBOutlet weak var tTotal3: UILabel!
    
    @IBOutlet weak var slidah: UISlider!
    
    func update(x:Float){
        tAmount1.text = "$" + String(x * slidah.value)
        tAmount2.text =  "$" + String(x * (slidah.value + 0.05))
        tAmount3.text =  "$" + String(x * (slidah.value + 0.1))
        tTotal1.text =  "$" + String(x + (x * (slidah.value)))
        tTotal2.text =  "$" + String(x + (x * (slidah.value + 0.05)))
        tTotal3.text =  "$" + String(x + (x * (slidah.value + 0.1)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        percent1.text = String(slidah.value * 100) + "%"
        percent2.text = String((slidah.value + 0.05) * 100) + "%"
        percent3.text = String((slidah.value + 0.1) * 100) + "%"
        let temp = Float(cost.text!)
        update(x: temp!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var dotIndex = false
    @IBAction func numPressed(_ sender: UIButton) {
        if sender.tag == 11{
            cost.text = "0"
            dotIndex = false
            let num = 0.0
            print(num)
            update(x: Float(num))
            // do update: Update(current cost)
        }
        else if sender.tag == 10{
            if dotIndex == false{
                var temp:String? = cost.text
                temp! += "."
                dotIndex = true
                cost.text = temp
                temp! += "0"
                let num = Float(temp!)
                print(num!)
                update(x:num!)
                // do update: Update(current cost)
            }
        }
        else{
            if cost.text == "0"{
                cost.text = "\(sender.tag)"
                let num = Float(cost.text!)
                print(num!)
                update(x:num!)
                // do update:
            }
            else{
                var temp:String? = cost.text
                temp! += "\(sender.tag)"
                cost.text = temp
                let num = Float(temp!)
                print(num!)
                update(x:num!)
                // do update:
            }
        }
    }
    @IBAction func slided(_ sender: UISlider) {
        percent1.text = String(slidah.value * 100) + "%"
        percent2.text = String((slidah.value + 0.05) * 100) + "%"
        percent3.text = String((slidah.value + 0.1) * 100) + "%"
        update(x: Float(cost.text!)!)
    }
}

