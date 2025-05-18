// Originator: La clase cuyo estado queremos guardar y restaurar
class Originator {
    private var state: String
    
    init(state: String) {
        self.state = state
        print("Originator: Estado inicial - \(state)")
    }
    
    // Cambia el estado
    func changeState(_ newState: String) {
        print("Originator: Cambiando estado de '\(state)' a '\(newState)'")
        state = newState
    }
    
    // Guarda el estado actual en un Memento
    func save() -> Memento {
        return ConcreteMemento(state: state)
    }
    
    // Restaura el estado desde un Memento
    func restore(from memento: Memento) {
        if let concreteMemento = memento as? ConcreteMemento {
            state = concreteMemento.state
            print("Originator: Estado restaurado a - \(state)")
        }
    }
}

// Protocolo Memento
protocol Memento {
    var stateDescription: String { get }
}

// Concrete Memento
class ConcreteMemento: Memento {
    let state: String
    
    var stateDescription: String {
        return "\(state) guardado"
    }
    
    init(state: String) {
        self.state = state
    }
}

// Caretaker: Maneja la historia de los mementos
class Caretaker {
    private var mementos: [Memento] = []
    private var originator: Originator
    
    init(originator: Originator) {
        self.originator = originator
    }
    
    func saveState() {
        print("\nCaretaker: Guardando estado actual...")
        mementos.append(originator.save())
    }
    
    func undo() {
        if !mementos.isEmpty {
            let lastMemento = mementos.removeLst()
            print("Caretaker: Restaurando estado: \(lastMemento.stateDescription)")
            originator.restore(from: lastMemento)
        } else {
            print("Caretaker: No hay más estados para restaurar")
        }
    }
    
    func showHistory() {
        print("\nHistorial de estados guardados:")
        mementos.enumerated().forEach { 
            index, memento in
            print("\(memento.stateDescription)")
        }
    }
}

// MARK: - Ejemplo de uso
let originator = Originator(state: "Inicio")
let caretaker = Caretaker(originator: originator)

// Guardamos el estado inicial
caretaker.saveState()

// Cambiamos el estado y guardamos
originator.changeState("Paso 1")
caretaker.saveState()

originator.changeState("Paso 2")
caretaker.saveState()

originator.changeState("Paso 3")

// Mostramos el historial
caretaker.showHistory()

// Deshacemos cambios
print("\nDeshaciendo cambios...")
caretaker.undo() // Vuelve a Paso 2
caretaker.undo() // Vuelve a Paso 1
caretaker.undo() // Vuelve a Inicio
caretaker.undo() // No hay más estados para restaurar