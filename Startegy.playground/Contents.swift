//Шпора по паттерну Strategy 

import UIKit
//Swimer
protocol SwimBehavor {
    func swim()
}

class ProfessionalSwimer: SwimBehavor {
    func swim() {
        print("professional swimer")
    }
}

class NonSwimmer: SwimBehavor {
    func swim() {
        print("none swiming")
    }
}

class MiddleSwimmer: SwimBehavor {
    func swim() {
        print("middle swimer")
    }
}
//Diver

protocol DiveBihavor {
    func dive ()
}

class ProfessionalDiver: DiveBihavor {
    func dive() {
        print("professional diver")
    }
}

class NewbieDiver: DiveBihavor {
    func dive() {
        print("Dive like a dota mid player")
    }
}

class MiddleDiver: DiveBihavor {
    func dive() {
        print("middle diver")
    }
}

//Runer

protocol RunBehavor {
    func run()
}

class BladeRunner: RunBehavor {
    func run() {
        print("Is where replicants?")
    }
}

class ProRunner: RunBehavor {
    func run() {
        print("proffesional runer")
    }
}

class Runer: RunBehavor {
    func run() {
        print("run faster")
    }
    
    
}



class Human {
    
  private var diverBehavor : DiveBihavor!
  private var swimBehavor: SwimBehavor!
  private var runBehavor: RunBehavor!
    
    func walk() {
        print("go-go-go")
    }
    
    func performSwim() {
        swimBehavor.swim()
    }
    
    func performDiver() {
        diverBehavor.dive()
    }
    
    func performRun() {
        runBehavor.run()
    }
    
    func setDiveBehavor(db: DiveBihavor) {
        self.diverBehavor = db
    }
    
    func setSwimBehavor(sb: SwimBehavor) {
        self.swimBehavor = sb
    }
    func setRunBehavor(rb: RunBehavor)  {
        self.runBehavor = rb
    }
    
    init(swimBehavor: SwimBehavor, diveBehavor: DiveBihavor, runBehavor: RunBehavor) {
        self.swimBehavor = swimBehavor
        self.diverBehavor = diveBehavor
        self.runBehavor = runBehavor
    }
    
   
}

let human = Human(swimBehavor: NonSwimmer(), diveBehavor: NewbieDiver(), runBehavor: BladeRunner())
human.walk()
human.performRun()

human.setSwimBehavor(sb: ProfessionalSwimer())
human.performSwim()

human.performDiver()


