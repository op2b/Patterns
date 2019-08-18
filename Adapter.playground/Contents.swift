import UIKit
//1: Example
//adaptee
class SimpleRobot {
    
    func sound() -> String {
        return "Simple robot at your command"
    }
}

//target
protocol SuperRobotProtocol {
    func  makeNoise() -> String
}


class SuperRobot: SuperRobotProtocol {
    
    func makeNoise() -> String {
        return "Superbot at your command!"
    }
    
}

//adapter
class SuperRobotAdapter: SuperRobotProtocol {
    
    var simpleRobot: SimpleRobot
    
    init(simpleRobot: SimpleRobot) {
        self.simpleRobot = simpleRobot
    }
    
    func makeNoise() -> String {
        return simpleRobot.sound() + " done with adapter"
    }
}



let robot = SimpleRobot()
print(robot.sound())
let superAdapter = SuperRobotAdapter(simpleRobot: robot)
print(superAdapter.makeNoise())

