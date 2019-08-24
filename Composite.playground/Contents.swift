//I Primer
import Foundation

protocol ImperiumSolder {
    func hire(soldier: ImperiumSolder)
    func getInfo()
    var lvl: Int {get}
}

//branch
class Centurion: ImperiumSolder {

    var lvl: Int
    private var soldiers = [ImperiumSolder]()

    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(soldier: ImperiumSolder) {
        self.soldiers.append(soldier)
    }
    
    func getInfo() {
        print(self.lvl.description + " lvl ligioner")
        for soldier in soldiers {
            soldier.getInfo()
        }
    }
}

//leaf
class Legioner: ImperiumSolder {
    
    var lvl: Int
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(soldier: ImperiumSolder) {
        print("cant hire")
    }
    
    func getInfo() {
        print(self.lvl.description + " lvl ligioner")
       
    }
}


let topCenturion = Centurion(lvl: 1)
let centurion = Centurion(lvl: 2)
let centurion3_1 = Centurion(lvl: 3)
let centurion3_2 = Centurion(lvl: 3)
let lowCenturion = Centurion(lvl: 11)

topCenturion.hire(soldier: centurion3_2)
topCenturion.hire(soldier: centurion)
centurion3_2.hire(soldier: lowCenturion)

topCenturion.getInfo()


//Primer 2

protocol Component {
    var id: UInt32 {get}
    func description() -> String
}

class WashingMachine: Component {
    
    var id = arc4random_uniform(100)
    
    func description() -> String {
        return "WashingMachine \(id)"
    }
}

class Computer: Component {
    
    var id = arc4random_uniform(100)
    
    func description() -> String {
        return "Computer \(id)"
    }
}

class Speakers: Component {
    
    var id = arc4random_uniform(100)
    
    func description() -> String {
        return "Speakers \(id)"
    }
}

class Composite: Component {
    
    var id = arc4random_uniform(100)
    
    private var components: [Component] = []
    
    func add(component: Component)  {
        components.append(component)
    }
    
    func remove(component: Component) {
        if let index = components.lastIndex(where: {$0.id == component.id}) {
            components.remove(at: index)
        }
    }
    
    
    func description() -> String {
        return components.reduce("", {"\($0)\($1.description()) "})
    }
}


let computer = Computer()
let smaalBox = Composite()
let mediumBox = Composite()
let largeBox = Composite()

smaalBox.add(component: WashingMachine())

mediumBox.add(component: Computer())
mediumBox.add(component: Speakers())

largeBox.add(component: smaalBox)
largeBox.add(component: mediumBox)
largeBox.add(component: WashingMachine())

print(computer.description())
print(smaalBox.description())
print(mediumBox.description())
print(largeBox.description())
