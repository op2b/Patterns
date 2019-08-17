import UIKit

// FIRST PRIMER
protocol SubJect {
    
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify (withString string: String)
}

protocol PropertyObserver {
    func didGet(newTask task: String)
    
}

class Teacher: SubJect {
    
    var obserberCollection = NSMutableSet()
    var homeTask = "" {
        didSet {
            notify(withString: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        obserberCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        obserberCollection.remove(observer)
    }
    
    func notify(withString string: String) {
        for observer in obserberCollection {
            
            (observer as! PropertyObserver).didGet(newTask: string)
        }
    }
    
    
}

class Pupil: NSObject, PropertyObserver {
    
    var homeTask = ""
    
    func didGet(newTask task: String) {
        homeTask = task
        print("new homeWork 2b done")
    }
    
    
}

let teacher = Teacher()
let puipl = Pupil()

teacher.add(observer: puipl)
teacher.homeTask = "Выучить бородино"
print(puipl.homeTask)



// SECOND PRIMER
protocol Observerebl {
    func add(observer: Observer)
    func remove(observer: Observer)
    func notify()
}

protocol Observer {
    var id: String {get set}
    func update(value: Int?)
}

final class  NewsResourses: Observerebl {
    
    var value: Int? {
        didSet {
           notify()
        }
    }
    
    private var observers: [Observer] = []
    
    func add(observer: Observer) {
        observers.append(observer)
    }
    
    func remove(observer: Observer) {
        guard let index = observers.enumerated().first(where: {$0.element.id == observer.id})?.offset else {return}
        observers.remove(at: index)
        
    }
    
    func notify() {
        observers.forEach {$0.update(value: value)}
    }
}

final class NewsAgency: Observer {
    var id = "news FIRST"
    
    func update(value: Int?) {
        guard let value = value else {return}
        print("NewAgancy handle update value \(value)")
    }
}

final class Reporter: Observer {
    var id = "reporter"
    
    func update(value: Int?) {
        guard let value = value else {return}
        print("Reporter. update value \(value)")
    }
}

final class SofaCritic: Observer {
    var id = "sofa critic"
    
    func update(value: Int?) {
        guard let value = value else {return}
        print("Sofa ctritic. New internet war about value: \(value)")
    }
}

let resource = NewsResourses()
let agancy = NewsAgency()
let reporter = Reporter()
let divanyCritic = SofaCritic()

resource.add(observer: agancy)
resource.add(observer: reporter)

resource.value = 5

resource.add(observer: divanyCritic)

resource.value = 7

resource.remove(observer: reporter)

resource.value = 10





