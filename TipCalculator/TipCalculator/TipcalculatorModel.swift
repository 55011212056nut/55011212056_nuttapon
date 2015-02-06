//
//  TipcalculatorModel.swift
//  TipCalculator
//
//  Created by iStudents on 2/6/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import Foundation

class TipcalculatorModel{
    
    var total : Double
    var taxPct : Double
    var subtotal : Double {
    
        get {
        
            return total / (taxPct + 1)
        }
    
    }
    
    
    init(total: Double,taxPct:Double){
        self.total = total
        self.taxPct = taxPct
        
        
    }
    
    
    func calcTipWithTipPct(tipPct:Double)-> Double {
        return subtotal * tipPct
        
    }
    
    func returnPoss()->[Int:Double]{
    let possibleTipsinferred = [0.15,0.18,0.20]
    let possibleTipsExplicit:[Double]=[0.15,018,0.20]
    var numberOfItems = possibleTipsinferred.count
    
    
    var retval = [Int:Double]()
    for possibleTip in possibleTipsinferred{
    
    let intPct = Int(possibleTip*100)
    
    retval[intPct]=calcTipWithTipPct(possibleTip)
    }
    return retval
    }
    

    
    
}


