//
//  PostingViewDelegate.swift
//  iOSBoard
//
//  Created by Shawn W Nha on 8/4/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import Foundation

protocol PostingViewDelegte: class {
    
    func dismissPressed(by controller:PostingViewController)
    func savePressed(by controller: PostingViewController, input1 ttl:String?, input2 desc:String?, at indexPath: NSIndexPath?)
}
