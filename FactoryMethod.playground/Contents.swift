import UIKit

//First Simple
protocol Spaceship {
    
    func fly()
}

class Ship: Spaceship {
    
    func fly() {
        print("the ship is going")
    }
}

class Battleship: Spaceship {
    
    func fly() {
        print("Battleship as your command")
    }
}

class Mothership: Spaceship {
    
    func fly() {
        print("Mother ship is shipping")
    }
}

protocol SpaceshipFactory {
    
    func produce() -> Spaceship
}

class ShipFactory: SpaceshipFactory {
    func produce() -> Spaceship {
        print("spaceship is created")
        return Ship()
    }
}

class BattleshipFactory: SpaceshipFactory {
    
    func produce() -> Spaceship {
        print("Battleship is created")
        return Battleship()
    }
}

class MothershipFactory: SpaceshipFactory {
    
    func produce() -> Spaceship {
        print("Mothership is created")
        return Mothership()
    }
}



let shipFactory = ShipFactory()
let ship = shipFactory.produce()
ship.fly()

let battleshipFactory = BattleshipFactory()
let battleCrouser = battleshipFactory.produce()
battleCrouser.fly()

let mothershipFactory = MothershipFactory()
let motherShip = mothershipFactory.produce()
motherShip.fly()

//Simple 2

protocol BotCraft {
    
    var name: String {get}
    var type: String {get}
    func start()
    func stop()
}

class MiningCraft: BotCraft {
    
    var name: String = "Шахтер"
    var type: String = "Добыча русурсов"
    
    func start() {
        print("Начата работа на шахте")
    }
    
    func stop() {
        print("Работа на шахте приостановлена")
    }
}

class WarCraft: BotCraft {
    
    var name: String = "Воин"
    var type: String = "Боевой режим"
    
    func start() {
        print("Включен боевой режим")
    }
    
    func stop() {
        print("Боевой режим выключен")
    }
}

class BuildingCraft: BotCraft {
    
    var name: String = "Строитель"
    var type: String = "Постройка сороужений"
    
    func start() {
        print("Строительство начато")
    }
    
    func stop() {
        print("Строительство преостановленно")
    }
}


class FactoryCraft {
    
    func createCraft(name: String) -> BotCraft? {
        switch name {
        case "Шахтер":
            return MiningCraft()
        case "Воин":
            return WarCraft()
        case "Строитель":
            return BuildingCraft()
        default:
            return nil
        }
    }
}

 var craftArray: [BotCraft] = []
 var craftName = "Воин"

var newCraft = FactoryCraft().createCraft(name: craftName)

if newCraft != nil {
    craftArray.append(newCraft!)
} else {
    print("У бота нет доступа для данного мастерства.")
}


for i in craftArray {
    i.start()
    i.stop()
}

