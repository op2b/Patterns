// I Primer

class Driver {
    
    let isGoodDriver: Bool
    let name: String
    
    
    init(isGood: Bool, name: String) {
        self.isGoodDriver = isGood
        self.name = name
        
    }
}

class Car {
    
    var goodDriverIterator: GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    
    var badDriversIterator: BadDriversIterator {
        return BadDriversIterator(drivers: drivers)
    }
    
    private let drivers = [Driver(isGood: true, name: "Mark"),
                           Driver(isGood: false, name: "Ivan"),
                           Driver(isGood: true, name: "Maria"),
                           Driver(isGood: false, name: "Morgan")]
    
}

extension Car: Sequence {
    func makeIterator() -> GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
}

class GoodDriverIterator: IteratorProtocol {
    private let drivers: [Driver]
    private var current = 0
    
    init(drivers: [Driver]) {
        self.drivers = drivers.filter{$0.isGoodDriver}
    }
    
        func next() -> Driver? {
            
        defer {
            current += 1
        }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDreivers() -> [Driver] {
        return drivers
    }
    
}

class BadDriversIterator: IteratorProtocol {
  
    
    
    private let drivers:[Driver]
    private var current = 0
    
    init(drivers: [Driver]) {
        self.drivers = drivers.filter{$0.isGoodDriver == false}
    }
    
    func next() -> Driver? {
        
        defer {
            current += 1
        }
        return drivers.count > current ? drivers[current] : nil
    }
    
    func allDreivers() -> [Driver] {
        return drivers
    }
}

let car = Car()
let goodDriverIteratpr = car.goodDriverIterator.next()
let badDriverIterator = car.badDriversIterator.allDreivers()

let goodDriverIterator = car.makeIterator().allDreivers()


// II Primer


class Destenetion {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
}

protocol Iterator {
    func next() -> Destenetion?
}

class DestenetionList {
    var distenetions: [Destenetion]
    
    init(destenetions:[Destenetion]) {
        self.distenetions  = destenetions
    }
}

class DestinationIterator: Iterator  {
    
    private var current = 0
    private var destenetions: [Destenetion]
    
    init(destenetionsList: DestenetionList) {
        self.destenetions = destenetionsList.distenetions
    }
    
    func next() -> Destenetion? {
        let next = current < destenetions.count ? destenetions[current] : nil
        current += 1
        return next
    }
}


class DestinationIterator2: Iterator  {
    
    private var current = 0
    private var destenetions: [Destenetion]
    
    init(destenetionsList: DestenetionList) {
        self.destenetions = destenetionsList.distenetions
        self.current = destenetions.count - 1
    }
    
    func next() -> Destenetion? {
        let next = current >= 0 ? destenetions[current] : nil
        current -= 1
        return next
    }
}


let list = DestenetionList(destenetions: [Destenetion(name: "Destenetion 1"),
                                          Destenetion(name: "Destenetion 2"),
                                          Destenetion(name: "Destenetion 3"),
                                          Destenetion(name: "Destenetion 4"),
                                          Destenetion(name: "Destenetion 5")])


let iteraror = DestinationIterator(destenetionsList: list)
let iterator2 = DestinationIterator2(destenetionsList: list)

while let element = iteraror.next(), let element2 = iterator2.next() {
    print("First iterator \(element.name)")
    print("Second iterator \(element2.name)")
}
