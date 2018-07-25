import UIKit

struct Card{
    var color: String
    var roll: Int
    
}
class Deck{
    var cards: [Card] = [Card]()
    init() {
        for x in 0...2{
            for _ in 0...9{
                var c: Card
                if x == 0 {
                    c = Card(color:"Blue",roll:Int(arc4random_uniform(2)+1))
                }
                else if x == 1 {
                    c = Card(color:"Red",roll:Int(arc4random_uniform(2)+3))
                }
                else {
                    c = Card(color:"Green",roll:Int(arc4random_uniform(2)+5))
                }
                self.cards.append(c)
            }
        }
    }
    func deal()-> Card{
        let rC = self.cards.remove(at:0)
        return rC
    }
    func isEmpty()-> Bool{
        if cards.count == 0{
            return true
        }
        else{
            return false
        }
    }
    func shuffle(){
        var shuffled = [Card]()
        
        let c = self.cards.count
        for _ in 0..<c{
            shuffled.append(self.cards[Int(arc4random_uniform(UInt32(c)))])
        }
        self.cards = shuffled
    }
}
class Player{
    var name: String
    var hand: [Card] = [Card]()
    
    init(name: String){
        self.name = name
    }
    func draw(deck: Deck) -> Card{
        let card = deck.deal()
        self.hand.append(card)
        return card
    }
    func rollDice() -> Int{
        let rand = Int(arc4random_uniform(6)+1)
        return rand
    }
    func matchingCards(c:String,r:Int)-> Int{
        var count = 0
        for x in 0..<hand.count{
            if self.hand[x].color == c && self.hand[x].roll == r {
                count += 1
            }
        }
        return count
    }
}

var deck1: Deck = Deck()
deck1.shuffle()
print(deck1.cards)
var shawn = Player(name: "Shawn")
for _ in 0...9{
    shawn.draw(deck: deck1)
}

