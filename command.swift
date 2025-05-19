// Protocolo Command (Comando)
protocol Command {
    func execute()
}

// Comandos Concretos
class ConcreteCommandA: Command {
    private let receiver: Receiver
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.actionA()
    }
}

class ConcreteCommandB: Command {
    private let receiver: Receiver
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.actionB()
    }
}

// Clase Receiver (Receptor)
class Receiver {
    func actionA() {
        print("Ejecutando Acción A en el Receptor")
    }
    
    func actionB() {
        print("Ejecutando Acción B en el Receptor")
    }
}

// Clase Invoker (Invocador)
class Invoker {
    private var command: Command?
    
    func setCommand(command: Command) {
        self.command = command
    }
    
    func executeCommand() {
        command?.execute() ?? print("No hay comando asignado")
    }
}

// Uso del patrón Command
let receiver = Receiver()
let commandA = ConcreteCommandA(receiver: receiver)
let commandB = ConcreteCommandB(receiver: receiver)

let invoker = Invoker()

// Ejecutar comando A
invoker.setCommand(command: commandA)
invoker.executeCommand()

// Ejecutar comando B
invoker.setCommand(command: commandB)
invoker.executeCommand()