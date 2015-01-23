class zoo {
    let animal : [String] = ["Frog","Turtle","Bird"]
    let food   : [String] = ["Bug","Fruit","Worm"]
    let animal1:String
    init(animal: String){
        self.animal1 = animal
    }
    func funcZoo() -> String {
        var st: String = ""
        for(var i=0; i < animal.count ; i++){
            if(animal[i] == animal1){
                st = food[i];
            }
        }
        return st
    }
    
}
let zoo1 = zoo(animal: "Turtle")
zoo1.funcZoo()