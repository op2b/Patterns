import UIKit

class Account {
    
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}

protocol Command {
    
    func execute()
    var isComplete: Bool {get set}
}

class Deposit: Command {
    
    private var _account: Account
    private var _amount: Int
    var isComplete: Bool = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
        
    }
    
    func execute() {
        _account.balance += _amount
        isComplete = true
    }
    
}

class Withdraw: Command {
    private var _account: Account
    private var _amount: Int
    var isComplete: Bool = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        if _account.balance >= _amount {
            _account.balance -= _amount
            isComplete = true
        } else {
            print("No money, no honey")
    }
 }
}

class TransactionManager {
    
    static let shared = TransactionManager()
    private init() {}
    private var _transactions: [Command] = []
    var pendingTransaction: [Command] {
        get {
            return self._transactions.filter{$0.isComplete == false}
        }
    }
    
    
    func addTransactions(command: Command) {
        self._transactions.append(command)
    }
    
    
    func processingTransations() {
        _transactions.filter{$0.isComplete == false}.forEach{$0.execute()}
    }
}

let account = Account(accountName: "Rotenberg", balance: 1000)
let transactionManager = TransactionManager.shared
transactionManager.addTransactions(command: Deposit(account: account, amount: 100))
transactionManager.addTransactions(command: Withdraw(account: account, amount: 500))
transactionManager.pendingTransaction
account.balance
transactionManager.processingTransations()
account.balance


// Primer 2

class LightScanner {
    
    var intency: Double = 1.0
    
    func swicthOn()  {
        print("Sacnner swicth ON")
    }
    
    func swichOff() {
        print("Scanner swicth OFF")
    }
}

class TurelColling {
    
    var temperature: Double = 2.5
    
    var mode: String {
        return temperature >= 25 ? "heatung system" : "cooling system"
    }
    
    func start() {
        print("Start \(mode)")
    }
    
    func stop() {
        print("Stop \(mode)")
    }
}

protocol Command1 {
    
    func execute()
}

class SwicthOnCommand: Command1 {
    
    var lightScanner: LightScanner
    
    init(light: LightScanner) {
        self.lightScanner = light
    }
    
    func execute() {
        lightScanner.swicthOn()
    }
}

class StartHeatingCommand: Command1 {
    var heater: TurelColling
    
    init(heater: TurelColling) {
        self.heater = heater
    }
    
    func execute() {
        if heater.temperature < 25 {
            heater.temperature = 25
        }
        heater.start()
    }
    
}

class Programm {
    var commands: [Command1] = []
    
    func start()  {
        commands.forEach{$0.execute()}
    }
}

let lightScanner = LightScanner()
let heater = TurelColling()

let lightOnCommand = SwicthOnCommand(light: lightScanner)
let heatherCommand  = StartHeatingCommand(heater: heater)

let eveningProgram = Programm()
eveningProgram.commands.append(lightOnCommand)
eveningProgram.commands.append(heatherCommand)
eveningProgram.start()
