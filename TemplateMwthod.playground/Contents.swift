
//Primer I
protocol DriveVehicle {
    func haveASeat()
    func useProtection()
    func lookAtMirrow()
    func turnSignal()
    func driveForward()
    func startVehicle()
}


extension DriveVehicle {
    
        func startVehicle() {
        haveASeat()
        useProtection()
        lookAtMirrow()
        turnSignal()
        driveForward()
    }
    
    func haveASeat() {
        preconditionFailure("This method should be overriden")
    }
    
    func useProtection()  {
        preconditionFailure("This method should be overriden")
    }
    
    func lookAtMirrow() {
        preconditionFailure("This method should be overriden")
    }
    
    func turnSignal() {
        preconditionFailure("This method should be overriden")
    }
    
    func driveForward() {
        preconditionFailure("This method should be overriden")
    }
}



class Bicycle: DriveVehicle {
    
     func haveASeat() {
        print("sit down in a bicycle seaty")
        
    }
    
     func useProtection()  {
        print("wear a helmet")
    }
    
     func lookAtMirrow() {
        print("look at little mirrow")
    }
    
     func turnSignal() {
        print("show left hand")
    }
    
     func driveForward() {
        print("pedal")
    }
}

class Car: DriveVehicle {
    
     func haveASeat() {
        print("sit down on a car seat")
        colseTheDoor()
    }
    
    func colseTheDoor() {
        print("close a door")
    }
    
     func useProtection()  {
        print("fasten seat bealt")
    }
    
     func lookAtMirrow() {
        print("look at  rearview mirrow")
    }
    
     func turnSignal() {
        print("turn on left turn light")
    }
    
     func driveForward() {
        print("push pedal\n")
    }
}

let car = Car()
let bicycle = Bicycle()
car.startVehicle()
bicycle.startVehicle()

// II Primer

class DataReadingAlgoritm {
    
    func openResourses() {
        fatalError("This method must be overriden in subclass")
    }
    
    func extractData() {
        print("Extractiong data...")
    }
    
    func parseData() {
        print("Parsing data...")
    }
    
    func processData() {
        print("ProcessingData")
    }
    
    func closeResurses() {
        fatalError("This method must be overriden in subclass")
    }
    
    final func readData() {
        openResourses()
        extractData()
        parseData()
        processData()
        closeResurses()
    }
    
}

class FileReader: DataReadingAlgoritm {
    
    override func openResourses() {
        print("Open file")
    }
    
    override func closeResurses() {
        print("Close file\n")
    }
}


class BufferData: DataReadingAlgoritm {
    
    override func openResourses() {
        print("Open buffer")
    }
    
    override func closeResurses() {
        print("Close buffer\n")
    }
}


class DataBase: DataReadingAlgoritm {
    
    override func openResourses() {
        print("Open base")
    }
    
    override func closeResurses() {
        print("Close base\n")
    }
}

let fileReader =  FileReader()
print("---------------------------")
fileReader.readData()
let bufferRader = BufferData()
bufferRader.readData()
let datareader = DataBase()
datareader.readData()
