import UIKit


protocol Robot {
    func activated()
}

class WorkerRobot: Robot {
  
    func activated() {
        print("Workerbot is activated")
    }
}

class GuardRobot: Robot {
    
    func activated() {
        print("Protection bot is online")
    }
}

protocol Cyborg {
    func activated()
}

class WorkerCyborg: Cyborg {
    
    func activated() {
        print("Worker cyborg is activated")
    }
}

class GuardCyborg: Cyborg {
    
    func activated() {
        print("Guard cyborg is activated")
    }
}

protocol Factory {
    func produceRobot() -> Robot
    func produceCyborg() -> Cyborg
}

class WorkerFactory: Factory {
    
    func produceRobot() -> Robot {
        print("Worker robot is created")
        return WorkerRobot()
    }
    
    func produceCyborg() -> Cyborg {
        print("Worker cyborg is created")
        return WorkerCyborg()
    }
}

class GuardFactory: Factory {
    
    func produceRobot() -> Robot {
        print("Guard bot is created")
        return GuardRobot()
    }
    
    func produceCyborg() -> Cyborg {
        print("Guard cyborg is created")
        return GuardCyborg()
    }
}

let workerFactory = WorkerFactory()
let workerCyborg = workerFactory.produceCyborg()
workerCyborg.activated()


let guardRobotFactory = GuardFactory()
let guardBot = guardRobotFactory.produceRobot()
guardBot.activated()
