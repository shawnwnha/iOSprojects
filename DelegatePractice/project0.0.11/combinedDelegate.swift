//
//  combinedDelegate.swift
//  project0.0.11
//
//  Created by Shawn W Nha on 7/26/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import Foundation

protocol combinedDelegate: class {
    func cancelButtonPressed(by: SecondTableTableViewController)
    func saveButtonPressed(by: SecondTableTableViewController, with text: String, at indexPath: NSIndexPath?)
}
