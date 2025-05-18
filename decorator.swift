// Protocolo que define la interfaz común para los componentes y decoradores
protocol Componente {
    func operacion() -> String
}

// Implementación concreta del componente básico
class ComponenteConcreto: Componente {
    func operacion() -> String {
        return "Operación básica"
    }
}

// Clase decoradora abstracta
class Decorador: Componente {
    private var componente: Componente
    
    init(_ componente: Componente) {
        self.componente = componente
    }
    
    func operacion() -> String {
        return componente.operacion()
    }
}

// Decorador concreto A
class DecoradorConcretoA: Decorador {
    override func operacion() -> String {
        return "Comportamiento A añadido a (\(super.operacion()))"
    }
}

// Decorador concreto B
class DecoradorConcretoB: Decorador {
    override func operacion() -> String {
        return "Comportamiento B añadido a (\(super.operacion()))"
    }
}

// Ejemplo de uso
func ejemploDecorator() {
    // Componente simple
    let componenteSimple: Componente = ComponenteConcreto()
    print(componenteSimple.operacion())
    
    // Decorado con A
    let decoradoA: Componente = DecoradorConcretoA(componenteSimple)
    print(decoradoA.operacion())
    
    // Decorado con B
    let decoradoB: Componente = DecoradorConcretoB(componenteSimple)
    print(decoradoB.operacion())
    
    // Decorado con A y luego B (anidado)
    let decoradoAB: Componente = DecoradorConcretoB(DecoradorConcretoA(componenteSimple))
    print(decoradoAB.operacion())
}

// Ejecutar el ejemplo
ejemploDecorator()