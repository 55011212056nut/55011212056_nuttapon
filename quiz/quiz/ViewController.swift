//
//  ViewController.swift
//  quiz
//
//  Created by iStudents on 2/6/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    var one = 0
    var two = 0
    var three = 0
    
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    
    
    @IBAction func B1(sender: AnyObject) {
        one = one + 1
        l1.text = String(format: "%d", one)
    }
    @IBAction func B2(sender: AnyObject) {
        two = two + 1
        l2.text = String(format: "%d",two)
    }
    @IBAction func B3(sender: AnyObject) {
        three = three + 1
        l3.text = String(format: "%d",three)
    }
    
    
    
    @IBAction func re(sender: AnyObject) {
        l1.text = "0"
        l2.text = "0"
        l3.text = "0"
        
        one = 0
        two = 0
        three = 0
    }

}

