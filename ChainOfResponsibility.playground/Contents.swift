class Enemy {
    let strength = 600
}

protocol MilitaryChain {
    var stength: Int {get}
    var nextRank: MilitaryChain? {get set}
    func shouldDefeatWithStr(amount: Int)
}

class Soldier: MilitaryChain {
    
    var stength = 100
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStr(amount: Int) {
        if amount < stength {
            print("Solider win!")
        } else  {
            nextRank?.shouldDefeatWithStr(amount: amount)
        }
    }
}

class Officer: MilitaryChain  {
    var stength: Int = 300
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStr(amount: Int) {
        if amount < stength {
            print("Officer win!")
        } else {
            nextRank?.shouldDefeatWithStr(amount: amount)
        }
    }
}

class General: MilitaryChain {
    var stength: Int = 1000
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStr(amount: Int) {
        if amount < stength {
            print("General Win")
        } else {
            print("We cant defeat this enemy")
        }
    }
}


let enemy = Enemy()
let soldier = Soldier()
let officer = Officer()
let general = General()

soldier.nextRank = officer
officer.nextRank = general

soldier.shouldDefeatWithStr(amount: enemy.strength)


// Second

class Responder {
    
    private var qa: [String: String]
    private var next: Responder?
    
    init(qa: [String: String]) {
        self.qa = qa
    }
    
    func setNext(_ next: Responder) {
        self.next = next
    }
    
    func answer(for question: String) -> String {
        if let answer = qa[question] {
            print("---done")
            return answer
        } else if let next = next {
            print("Can't handle. Processing to the next...")
            return next.answer(for: question)
        }
        print("no answer")
        return "Sry man"
    }
}


class CallCenter {
    private var answerPhone: Responder
    private var manager: Responder
    private var expert: Responder
    
    init(answerPhone: Responder, manager: Responder, expert: Responder) {
        self.answerPhone = answerPhone
        self.manager  = manager
        self.expert = expert
    }
    
    func receiveCall(question: String) {
        print("Anser \(answerPhone.answer(for: question))")
    }
}


let answerPhone = Responder(qa: ["How can i off it?": "Push the green button",
                                 "How can i on it?": "Push the red button"])
let manger = Responder(qa: ["I wanna delete accaunt": "Ok"])
let expert = Responder(qa: ["Spectific tech question": "Specific answer"])

answerPhone.setNext(manger)
manger.setNext(expert)

let callCentr  = CallCenter(answerPhone: answerPhone, manager: manger, expert: expert)
callCentr.receiveCall(question: "Spectific tech quest")
