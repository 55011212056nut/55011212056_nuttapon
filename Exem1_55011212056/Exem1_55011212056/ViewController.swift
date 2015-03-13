//
//  ViewController.swift
//  Exem1_55011212056
//
//  Created by iStudents on 3/13/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var mid: UITextField!
    
    @IBOutlet weak var mid2: UITextField!
    
    @IBOutlet weak var score: UITextField!
    
    
    @IBOutlet weak var score2: UITextField!
    
    
    @IBOutlet weak var final: UITextField!
    
    @IBOutlet weak var final2: UITextField!
    
    
    
    @IBOutlet weak var showname: UILabel!
    
    @IBOutlet weak var grade: UILabel!
    
    @IBOutlet weak var sumscore: UILabel!
    
    @IBOutlet weak var kk: UILabel!
    
    @IBAction func sum(sender: AnyObject) {
        
        
     
        
        let a:Int? = mid.text.toInt()
        let b = Double((mid2.text as NSString).doubleValue)
        
        var c:Int? = score.text.toInt()
       var d = Double((score2.text as NSString).doubleValue)
        
        
        
        
       var e:Int? = final.text.toInt()
        
        var f = Double((final2.text as NSString).doubleValue)
        
        
        
        
        //var sum:Double = 0.0
        
        
        
        var sum2 = b+Double(a!)+Double(c!)+d+Double(e!)+f
        
       // var aa = Double(b) + a
       
        
       sumscore.text = "\(sum2)"
        
        
        
        
        
    
        if(sum2>=80){
        
        
        
         grade.text = "A"
        
        }
        
        else if(sum2>=75){
            
            
            
            grade.text = "B+"
            
        }
        

            
        else if(sum2>=68){
            
            
            
            grade.text = "B"
            
        }
        
        
        
        else if(sum2>=62){
            
            
            
            grade.text = "C+"
            
        }
        
        
        
        
        else if(sum2>=56){
            
            
            
            grade.text = "C"
            
        }
        
        
        
        else if(sum2>=50){
            
            
            
            grade.text = "D+"
            
        }

        
        else if(sum2>=44){
            
            
            
            grade.text = "D"
            
        }
        
        else{
        grade.text = "F"
        }

        
        
        
        
      // grade.text = "\(sum)"
        
        
        
        
        
        
        var ran = arc4random_uniform(30)
        var ff = (f+Double(e!))*0.05
        
        kk.text = "\(ran)"
        let ll:Int? = kk.text?.toInt()
        
       
showname.text="คะแนนรวมวิชา \(name.text)"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

