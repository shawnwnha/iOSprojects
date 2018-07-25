import UIKit

class Animal{
    var name:String
    var health: Int
    init(name:String) {
        self.name = name
        self.health = 100
    }
    func displayHealth(){
        print(self.health)
    }
}

class Cat:Animal{
    override init(name:String){
        super.init(name: name)
        self.health = 150
    }
    func growl(){
        print("RAWRRRRR")
    }
    func run(){
        print("Running")
        self.health -= 10
    }
}

class Cheetah:Cat{
    override func run() {
        print("Faster running!!!")
        self.health -= 50
    }
    func sleep(){
        if self.health + 50 <= 200{
            self.health += 50
        }
    }
}

class Lion:Cat{
    override init(name:String){
        super.init(name: name)
        self.health = 200
    }
    override func growl() {
        print("ROOOOOOAR!")
    }
}

var cheetah = Cheetah(name: "CHEEEZE")
var lion = Lion(name: "LIIIOOOON")

