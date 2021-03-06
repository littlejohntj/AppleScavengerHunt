//
//  AddViewController.swift
//  AppleScavengerHunt
//
//  Created by Todd Littlejohn on 2/4/16.
//  Copyright © 2016 Todd Littlejohn. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    var newItem:ScavengerHuntItem?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if let name = textField.text {
                
                if !name.isEmpty {
                    newItem = ScavengerHuntItem(name: name)
                }
                
            }
        }
    }
    
}

