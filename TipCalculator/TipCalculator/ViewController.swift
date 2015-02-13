//
//  ViewController.swift
//  TipCalculator
//
//  Created by iStudents on 2/6/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet var totalTextField: UITextField!
    @IBOutlet var taxPctLabel2: UILabel!
    @IBOutlet var taxPctSlider: UISlider!
    @IBOutlet weak var resultTextView: UITextView!

    
    
    @IBAction func calculateTapped(sender: AnyObject) {
        
        tipcalc.total = Double((totalTextField.text as NSString).doubleValue)
        
        let possibleTip = tipcalc.returnPoss()
        var results = ""
        
        for (tipPct, tipValue) in possibleTip{
        results += "\(tipPct)%: \(tipValue)"
            
        }
        resultTextView.text = results
        
    }
    
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        
        tipcalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    
    
    @IBAction func viewTapped(sender: AnyObject) {
       
        totalTextField.resignFirstResponder()
    }
    
    
    
    let tipcalc = TipcalculatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI() {
    
        totalTextField.text = String (format : "%0.2f",tipcalc.total)
        taxPctSlider.value = Float(tipcalc.taxPct) * 100.0
        
        taxPctLabel2.text = "Tax percentage (\(Int(taxPctSlider.value))%)"
        
        resultTextView.text = ""
    
    }
    
    
}

