import UIKit

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
