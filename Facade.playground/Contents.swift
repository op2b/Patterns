import UIKit
// I Primer
class FruitShop {
    
    func buyFruit() -> String {
        return "fruit"
    }
}

class MeatShop {
    
    func buyMeat() -> String {
        return "meat"
    }
}

class MilkShop {
    
    func buyMilk() -> String {
        return "milk"
    }
}

class SweetShop {
    
    func buySweet() -> String {
        return "sweets"
    }
}

class BreadShop {
    
    func buyBread() -> String {
        return "bread"
    }
}
//Facade
class Supermarket {
    
   private let fruitShop = FruitShop()
   private let meatShop = MeatShop()
   private let milkShop = MilkShop()
   private let sweetShop = SweetShop()
   private let breadShop = BreadShop()
    
    func buySomeProduct() -> String {
        var products = ""
        
        products += fruitShop.buyFruit() + ", "
        products += meatShop.buyMeat() + ", "
        products += milkShop.buyMilk() + ", "
        products += sweetShop.buySweet() + ", "
        products += breadShop.buyBread() + ", "
        
        return products
    }
}

let sm = Supermarket()
sm.buySomeProduct()

// II Primer
class MAchine {
    enum State {
        case notRuning
        case ready
        case running
    }
    
    private(set) var state: State = .ready
    
    func startMachine() {
        print("Process starting....")
        state = .ready
        state = .running
    }
    
    func stopMachine()  {
        print("Process Finished.....")
        state = .notRuning
        print("Machine stop")
    }
}

class RequestManager {
    
    var isCorrect = false
    
    func connectToTerminal() {
        print("Connectiong terminal")
        isCorrect = true
    }
    
    func disconnectToTerminal() {
        print("Disconnected....")
        isCorrect = false
    }
    
    func getStatusRequest(for machine: MAchine) -> MAchine.State {
        print("Sending status request.....")
        return machine.state
    }
    
    func sendStartRequest(for machine: MAchine) {
        print("Sending request to start machine...")
    }
    func sendStopRequest(for machine: MAchine) {
        print("Sending request to stop machine...")
    }
}

protocol Facade {
    func startMachine()
}

class ConcrateFacade: Facade {
    func startMachine() {
        
        let machine = MAchine()
        let manager = RequestManager()
        
        if !manager.isCorrect {
            manager.connectToTerminal()
        }
        
        if manager.getStatusRequest(for: machine) == .ready {
            print("Machine ready to online")
            manager.sendStartRequest(for: machine)
        }

    }
}

let smpleInterface = ConcrateFacade()
smpleInterface.startMachine()
