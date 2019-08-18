import UIKit

final class Singletone {
    
    static let shared = Singletone()
    
    private init() {
        
    }
    
    var value = 0
    
    func doSomething () {
        print("Do something with value")
    }
    
}

var object = Singletone.shared
object.value = 1000

var secondObject = Singletone.shared
object.value = 2000

object.doSomething()
secondObject.doSomething()

print(object === secondObject)



