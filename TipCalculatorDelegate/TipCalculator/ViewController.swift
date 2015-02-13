//
//  ViewController.swift
//  TipCalculator
//
//  Created by iStudents on 2/6/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

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
  

    
    @IBOutlet weak var resultTableView: UITableView!
    
    @IBAction func calculateTapped(sender: AnyObject) {
        
        tipcalc.total = Double((totalTextField.text as NSString).doubleValue)
        
        let possibleTip = tipcalc.returnPoss()
       sortedKeys = sorted(Array(possibleTips.keys))
        tableView.reloadData()
        
        
    }
    
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        
        tipcalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    
    
    @IBAction func viewTapped(sender: AnyObject) {
       
        totalTextField.resignFirstResponder()
    }
    
    
    
    let tipcalc = TipcalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = Dictionary<Int, (tipAmt:Double,total:Double)>()
    var sortedKeys:[Int] = []
    
    func refreshUI() {
    
        totalTextField.text = String (format : "%0.2f",tipcalc.total)
        taxPctSlider.value = Float(tipcalc.taxPct) * 100.0
        
        taxPctLabel2.text = "Tax percentage (\(Int(taxPctSlider.value))%)"
        
       
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total

        cell.textLabel!.text = "\(tipPct)%:"
        cell.detailTextLabel!.text = String(format: "Tip: $%02f, Total: $%0.2f", tipAmt, total)
        
        
        return cell
        
    }
    
    
}

