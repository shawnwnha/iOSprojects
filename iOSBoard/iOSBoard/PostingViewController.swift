//
//  PostingViewController.swift
//  iOSBoard
//
//  Created by Shawn W Nha on 8/3/18.
//  Copyright © 2018 Shawn W Nha. All rights reserved.
//

import UIKit

class PostingViewController: UITableViewController, UITextViewDelegate {
    
    weak var delegate: PostingViewDelegte?
    
    var preText: String?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var ttl: UITextField!
    @IBOutlet weak var desc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desc.layer.cornerRadius = 5
        desc.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        desc.layer.borderWidth = 0.5
        desc.clipsToBounds = true
        desc.text = "Description"
        desc.textColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
        desc.delegate = self
    }
    
    @IBAction func dismissPressed(_ sender: UIBarButtonItem) {
        delegate?.dismissPressed(by: self)
    }
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        if ttl.text?.count == 0 {
            ttl.placeholder = "Title must be filled."
        }else{
            delegate?.savePressed(by: self, input1: ttl.text, input2: desc.text, at: indexPath)
        }
    }
    
    // ############################### uitextview placeholder set
    func textViewDidBeginEditing(_ textView: UITextView) {    
        if textView.text != "" {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""{
            textView.text = "Description"
            textView.textColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
        }
    }
    // ###############################
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height - 64.0
    }
    // ###############################
    
}
