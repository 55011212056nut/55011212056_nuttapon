// Playground - noun: a place where people can play

class cal{
    
    let num1 : Double
    let num2 : Double
    let st : String
  
    init(num1:Double,num2:Double,st:String){
       
         self.num1 = num1
        self.num2 = num2
        self.st = st
        
    }
    
    
    func calcal () -> Double{
    
    
        if (st == "+"){
           var sum = a()
            return sum
            
        }
        
        
        if (st == "-"){
            var sum = b()
            return sum
            
        }
        
        
        if (st == "*"){
            var sum = c()
            return sum
            
        }
        
        
        if (st == "/"){
            var sum = d()
            return sum
            
        }
        
        return 0
    
    	
    }
    
    
    
    func a () -> Double{
    
    
        let x = num1+num2
        return x
    }
    
    
    func b () -> Double{
        
        
        let x = num1-num2
        return x
    }
    
    
    func c () -> Double{
        
        
        let x = num1*num2
        return x
    }
    
    
    func d () -> Double{
        
        
        let x = num1/num2
        return x
    }

    
    
    
    
    
    
}
let cal2=cal( num1:5, num2:5,st: "*")
cal2.calcal()



