// Protocolo que define el comportamiento del Mediator
protocol Mediator {
    func notify(sender: Colleague, event: String)
}

// Clase base para los colegas
class Colleague {
    var mediator: Mediator?
    
    init(mediator: Mediator? = nil) {
        self.mediator = mediator
    }
    
    func setMediator(mediator: Mediator) {
        self.mediator = mediator
    }
}

// Implementación concreta del Mediator
class ConcreteMediator: Mediator {
    private var colleague1: ConcreteColleague1
    private var colleague2: ConcreteColleague2
    
    init(colleague1: ConcreteColleague1, colleague2: ConcreteColleague2) {
        self.colleague1 = colleague1
        self.colleague2 = colleague2
        
        self.colleague1.setMediator(mediator: self)
        self.colleague2.setMediator(mediator: self)
    }
    
    func notify(sender: Colleague, event: String) {
        switch event {
        case "EventA":
            print("Mediator reacciona a EventA y notifica a Colleague2")
            colleague2.reactToEventA()
        case "EventB":
            print("Mediator reacciona a EventB y notifica a Colleague1")
            colleague1.reactToEventB()
        default:
            print("Evento no reconocido")
        }
    }
}

// Implementaciones concretas de colegas
class ConcreteColleague1: Colleague {
    func operationA() {
        print("Colleague1 ejecuta OperationA y notifica al mediator")
        mediator?.notify(sender: self, event: "EventA")
    }
    
    func reactToEventB() {
        print("Colleague1 reacciona al EventB")
    }
}

class ConcreteColleague2: Colleague {
    func operationB() {
        print("Colleague2 ejecuta OperationB y notifica al mediator")
        mediator?.notify(sender: self, event: "EventB")
    }
    
    func reactToEventA() {
        print("Colleague2 reacciona al EventA")
    }
}

// Ejemplo de uso
let colleague1 = ConcreteColleague1()
let colleague2 = ConcreteColleague2()

let mediator = ConcreteMediator(colleague1: colleague1, colleague2: colleague2)

print("--- Ejecutando OperationA en Colleague1 ---")
colleague1.operationA()

print("\n--- Ejecutando OperationB en Colleague2 ---")
colleague2.operationB()