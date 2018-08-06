//
//  Delegate.swift
//  project0.0.17
//
//  Created by Shawn W Nha on 8/1/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import Foundation

protocol Delegate: class {
    func gobackPressed(by controller: SecondViewController, name: String?, email: String?)
}
