//
//  Cells.swift
//  project0.0.14
//
//  Created by Shawn W Nha on 7/27/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import Foundation
import UIKit

class Cells: UITableViewCell {
    
    weak var delegate: Delegate?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var digitLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBAction func minusPressed(_ sender: UIButton) {
        delegate?.minusPressed(by: indexPath)
        sender.isEnabled = false
        sender.isHidden = true
        plusButton.isHidden = false
        plusButton.isEnabled = true
    }
 
    @IBAction func plusPressed(_ sender: UIButton) {
        delegate?.plusPressed(by: indexPath)
        sender.isEnabled = false
        sender.isHidden = true
        minusButton.isHidden = false
        minusButton.isEnabled = true
    }
}
