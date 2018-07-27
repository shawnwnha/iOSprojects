//
//  Delegate.swift
//  project0.0.12
//
//  Created by Shawn W Nha on 7/26/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import Foundation
//
protocol Delegate: class {
    func addPressed (by controller: SecondViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelPressed (by controller: SecondViewController)
}
