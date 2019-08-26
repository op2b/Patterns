
// Virtual proxy
class User {
    let id = "123"
}

protocol ServerProtcol {
    func grandAccess(user: User)
    func denyAccess(user: User)
}

class ServerSide: ServerProtcol {
    
    func grandAccess(user: User) {
        print("grandAccess granted to user with id \(user.id)")
    }
    
    func denyAccess(user: User) {
        print("grandAccess deny to user with id \(user.id)")
    }
}

class ServerProxy: ServerProtcol {
    
    lazy private var server: ServerSide = ServerSide()
    
    func grandAccess(user: User) {
        server.grandAccess(user: user)
    }
    
    func denyAccess(user: User) {
        server.denyAccess(user: user)
    }
    
}






let user = User()
let proxy = ServerProxy()

proxy.grandAccess(user: user)
proxy.denyAccess(user: user)


// Guard Proxy

class SomeUser {
    
    let name : String
    let pass : String
    
    init(name: String, pass: String) {
        self.name = name
        self.pass = pass
    }
}

protocol NewSerberProtocol {
    func grandAccess(user: SomeUser)
}

class SereverSideI: NewSerberProtocol {
    func grandAccess(user: SomeUser) {
        print("grandAccess  to user with id \(user.name)")
    }
}

class NewServerProxy: NewSerberProtocol {
    
    private var server: SereverSideI!
    
    func grandAccess(user: SomeUser) {
        guard server != nil else {
            print("Access cant be granted")
            return
        }
        server.grandAccess(user: user)
    }
    
    func authenticate(user: SomeUser) {
        guard user.pass == "123" else {return}
        print("user acsecc")
        server = SereverSideI()
    }
}


let userI = SomeUser(name: "Jhon", pass: "123")


let serv = NewServerProxy()
serv.grandAccess(user: userI)
serv.authenticate(user: userI)
serv.grandAccess(user: userI)



class Lock {
    
    func open() {
        print("unlock")
    }
    
    func close() {
        print("lock")
    }
}

protocol LockingSystem {
    func open()
    func close()
}

class ProxyLock: LockingSystem {
    lazy private var lock : Lock = Lock()
    
    func open() {
        lock.open()
    }
    
    func close() {
        lock.close()
    }
}

let lock = Lock()
lock.open()


