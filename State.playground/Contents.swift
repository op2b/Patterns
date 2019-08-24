import UIKit

// I Primer

protocol State {
    func on(printer: Printer)
    func off(printer: Printer)
    func printDocumnet(printer: Printer)
}


class OnState: State {
    func on(printer: Printer) {
        print("it is already on")
    }
    
    func off(printer: Printer) {
        print("turinig printer off")
        printer.set(state: OffState())
    }

    func printDocumnet(printer: Printer) {
        print("printing")
        printer.set(state: Print())
        
    }
}

class OffState: State {
    func on(printer: Printer) {
        print("turningOn")
        printer.set(state: OnState())
        
    }
    
    func off(printer: Printer) {
        print("already  off")
    }
    
    func printDocumnet(printer: Printer) {
        print("it is off!")
        
        
    }
    
}

class Print: State {
    func on(printer: Printer) {
        print("it is already on")
    }
    
    func off(printer: Printer) {
        print("turinig printer off")
        printer.set(state: OffState())
    }
    
    func printDocumnet(printer: Printer) {
        print("it is already printing")
       
        
    }
    
}

class Printer {
    
    var state: State
    
    init() {
        self.state = OnState()
    }
    
    func set(state: State) {
    self.state = state
  }
    
    func turnOn() {
        state.on(printer: self)
    }
    func turnOff() {
        state.off(printer: self)
    }
    func printDocument() {
        state.printDocumnet(printer: self)
    }
}


let printer = Printer()
printer.turnOff()
printer.printDocument()

printer.turnOn()
printer.printDocument()

// II Primer


protocol StateI {
    
    var description: String {get}
    func setTask(_ task: Task)
    func startProgerss()
    func startTesting()
    func close()
    func open()
}


class OpenState: StateI {
    
    private var task: Task?
    let description = "Open at \(Date())"
    
    func setTask(_ task: Task) {
        self.task = task
    }
    
    func startProgerss() {
        task?.setState(InprogressState())
    }
    
    func startTesting() {
        print("--- need to start progress.")
    }
    
    func close() {
        task?.setState(CloseState())
    }
    
    func open() {
        print("--- already is open.")
    }
    
    init() {
        
    }
}

class InprogressState: StateI {
    
    private var task: Task?
    let description = "Open at \(Date())"
    
    func setTask(_ task: Task) {
        self.task = task
    }
    
    func startProgerss() {
        print("--- Already in progress.")
    }
    
    func startTesting() {
        task?.setState(InTesting())
    }
    
    func close() {
        print("--- Need testing.")
    }
    
    func open() {
        task?.setState(OpenState())
    }
    
    init() {
        
    }
}

class InTesting: StateI {
    
    private var task: Task?
    let description = "Open at \(Date())"
    
    func setTask(_ task: Task) {
        self.task = task
    }
    
    func startProgerss() {
        task?.setState(InprogressState())
    }
    
    func startTesting() {
        print("--- Already in testing")
    }
    
    func close() {
        task?.setState(CloseState())
    }
    
    func open() {
        print("--- Needs 2b closed")
    }
    
    init() {
        
    }
}

class CloseState: StateI {
    
    private var task: Task?
    let description = "Open at \(Date())"
    
    func setTask(_ task: Task) {
        self.task = task
    }
    
    func startProgerss() {
        task?.setState(InprogressState())
    }
    
    func startTesting() {
        print("--- need ti be opened first.")
    }
    
    func close() {
        print("--- already open")
    }
    
    func open() {
        task?.open()
    }
    
    init() {
        
    }
}




class Task {
    
    var history  = "\nTask history:\n"
    private var state: StateI
    
    init() {
        state = OpenState()
        state.setTask(self)
        history += state.description
        print("---\(state.description)")
        
    }
    
    func setState(_ state: StateI) {
        
        print("---\(state.description)")
        self.state = state
        state.setTask(self)
        history += state.description
    }
    
    func startProgerss() {
        state.startProgerss()
    }
    
    func startTesting() {
        state.startTesting()
    }
    
    func close() {
        state.close()
    }
    
    func open() {
        state.open()
    }
    
}

let task = Task()
task.startProgerss()
task.startTesting()
task.open()
task.close()
task.startTesting()
task.startProgerss()

print(task.history)
