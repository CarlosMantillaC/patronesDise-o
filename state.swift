// Protocolo que define la interfaz State
protocol State {
    func handle(context: Context)
}

// Implementaciones concretas de State
class ConcreteStateA: State {
    func handle(context: Context) {
        print("Manejando solicitud en Estado A")
        // Transición al siguiente estado
        context.setState(ConcreteStateB())
    }
}

class ConcreteStateB: State {
    func handle(context: Context) {
        print("Manejando solicitud en Estado B")
        // Transición al siguiente estado
        context.setState(ConcreteStateA())
    }
}

// Clase Contexto que mantiene el estado actual
class Context {
    private var state: State
    
    init() {
        // Estado inicial
        self.state = ConcreteStateA()
    }
    
    func setState(_ state: State) {
        self.state = state
        print("Estado cambiado a \(type(of: state))")
    }
    
    func request() {
        state.handle(context: self)
    }
}

// Ejemplo de uso
let context = Context()

// Las solicitudes delegarán al estado actual
context.request()  // Maneja en estado A y transiciona a B
context.request()  // Maneja en estado B y transiciona a A
context.request()  // Maneja en estado A y transiciona a B