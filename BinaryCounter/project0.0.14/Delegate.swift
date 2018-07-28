//
//  Delegate.swift
//  project0.0.14
//
//  Created by Shawn W Nha on 7/28/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import Foundation

protocol Delegate: class {
    func minusPressed(by indexPath: NSIndexPath?)
    func plusPressed(by indexPath: NSIndexPath?)
}
