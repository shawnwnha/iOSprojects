//
//  DelegateBtoA.swift
//  project0.0.15
//
//  Created by Shawn W Nha on 7/28/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import Foundation
import UIKit

protocol DelegateBtoA: class {
    func AddPressed(by Controller: SecondViewController, ttl Title: String, desc Description:String, dt Datetime: Date)
}
