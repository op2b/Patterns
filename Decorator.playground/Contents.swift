import UIKit

//Exaple 1 : Ferrari

protocol Ferarri {
    func getPrice() -> Double
    func getDecription() -> String
}

class F20: Ferarri {
    
    func getPrice() -> Double {
        return 120
    }
    
    func getDecription() -> String {
        return "Ferrari F20"
    }
}

class FerarriDecorator: Ferarri {
    
    func getPrice() -> Double {
        return decorated.getPrice()
    }
    
    func getDecription() -> String {
        return decorated.getDecription()
    }
    
    
    private let decorated: Ferarri
    
    required init (df: Ferarri) {
        self.decorated = df
    }
    
    
}

class PremiumAudioSystem: FerarriDecorator {
    required init(df: Ferarri) {
        super.init(df: df)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getDecription() -> String {
        return super.getDecription() + " with premium auido system"
    }
}

class PanoraminSunRoof: FerarriDecorator {
    required init(df: Ferarri) {
        super.init(df: df)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 20
    }
    
    override func getDecription() -> String {
        return super.getDecription() + " with panoramic sun roof"
    }
}

var ferarriF20: Ferarri = F20()
ferarriF20.getDecription()
ferarriF20.getPrice()

ferarriF20 = PremiumAudioSystem(df: ferarriF20)
ferarriF20.getDecription()
ferarriF20.getPrice()

ferarriF20 = PremiumAudioSystem(df: ferarriF20)
ferarriF20.getDecription()
ferarriF20.getPrice()


//Example 2: Coffe

protocol Cofe {
    func getPrice() -> Double
    func getIngridients() -> String
}

class Espresso: Cofe {
    
    func getPrice() -> Double {
        return 50
    }
    
    func getIngridients() -> String {
        return "Espresso"
    }
}
    
    class CoffeDecorator: Cofe {
        private var coffe: Cofe
        
       required init(coffe: Cofe) {
            self.coffe = coffe
        }
        
        func getPrice() -> Double {
            return coffe.getPrice()
        }
        
        func getIngridients() -> String {
            return coffe.getIngridients()
        }
    }
    
    class Milk: CoffeDecorator {
        required init(coffe: Cofe) {
            super.init(coffe: coffe)
        }
        
        override func getPrice() -> Double {
            return super.getPrice() + 20
        }
        
        override func getIngridients() -> String {
            return super.getIngridients() + " ,milk."
        }
    }
    
    class Whip: CoffeDecorator {
        required init(coffe: Cofe) {
            super.init(coffe: coffe)
        }
        
        override func getPrice() -> Double {
            return super.getPrice() + 30
        }
        override func getIngridients() -> String {
            return super.getIngridients() + ",whip"
        }
    }
    
    class Chocolate: CoffeDecorator {
        required init(coffe: Cofe) {
            super .init(coffe: coffe)
        }
        
        override func getPrice() -> Double {
            return super.getPrice() + 40
        }
        override func getIngridients() -> String {
            return super.getIngridients() + " ,chocolate"
        }
    }


let espresso = Espresso()
let capuchino = Whip(coffe: espresso)
let capChoc = Chocolate(coffe: capuchino)

print("Espresso cost is \(espresso.getPrice()), espresso ingridients: \(espresso.getIngridients())")
print("Capuccino cost is \(capuchino.getPrice()), capuccino ingridients: \( capuchino.getIngridients())")
print("CapChoc cost is \(capChoc.getPrice()), capChoc ingridients: \(capChoc.getIngridients())")

