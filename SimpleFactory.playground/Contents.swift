import UIKit

//First simple

enum WarMAchineType {
    case heavy
    case loght
}


protocol WarMachine {
    func drive()
}

class HeavyWarMachine: WarMachine {
    func drive() {
        print("You drive a heavy war machine")
    }
}

class LightWarMachine: WarMachine {
    func drive () {
        print("you drive light war machine")
    }
}

// Factory
class WarMachineFactroy {
    
    static func produceMachine(type: WarMAchineType) -> WarMachine {
        var warMachine: WarMachine
        
        switch type {
        case .loght:
            warMachine = HeavyWarMachine()
        case .heavy:
            warMachine = LightWarMachine()
        }
        return warMachine
    }
}

let heavyTank = HeavyWarMachine()
heavyTank.drive()

let warJeep = LightWarMachine()
warJeep.drive()

let t90 = WarMachineFactroy.produceMachine(type: .heavy)
let bmp = WarMachineFactroy.produceMachine(type: .loght)
