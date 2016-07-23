//
//  ViewController.swift
//  RGSDotSequenceView
//
//  Created by Randel Smith on 7/23/16.
//  Copyright © 2016 Randel Smith rs@randelsmith.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dotSequenceView: RGSDotSequenceView!

    override func viewDidLoad() {
        super.viewDidLoad()
        dotSequenceView.inactiveColor = UIColor.yellowColor()
        dotSequenceView.activeColor = UIColor.redColor()
    }

    @IBAction func pre(sender: AnyObject) {
        dotSequenceView.pre()
    }
    @IBAction func next(sender: AnyObject) {
        dotSequenceView.next()
    }
}

