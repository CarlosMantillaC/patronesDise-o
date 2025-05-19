// Clase Abstracta que define el esqueleto del algoritmo
protocol ProcesadorProtocol {
    // Método template - no puede ser sobrescrito
    func ejecutarProceso()
    
    // Métodos primitivos que deben ser implementados
    func paso1()
    func paso2()
    
    // Métodos con implementación por defecto
    func paso3()
    
    // Método hook - opcional para extender comportamiento
    func necesitaPasoOpcional() -> Bool
    func pasoOpcional()
    
    // Paso final común
    func pasoFinal()
}

// Extensión para implementaciones por defecto
extension ProcesadorProtocol {
    func ejecutarProceso() {
        paso1()
        paso2()
        paso3()
        if necesitaPasoOpcional() {
            pasoOpcional()
        }
        pasoFinal()
    }
    
    func paso3() {
        print("Ejecutando paso 3 (implementación por defecto)")
    }
    
    func necesitaPasoOpcional() -> Bool {
        return false
    }
    
    func pasoOpcional() {
        // Implementación vacía por defecto
    }
    
    func pasoFinal() {
        print("Ejecutando paso final común a todos los procesadores")
    }
}

// Implementación Concreta 1
class ProcesadorConcreto1: ProcesadorProtocol {
    func paso1() {
        print("Procesador1 - Ejecutando paso 1 específico")
    }
    
    func paso2() {
        print("Procesador1 - Ejecutando paso 2 específico")
    }
    
    func necesitaPasoOpcional() -> Bool {
        return true
    }
    
    func pasoOpcional() {
        print("Procesador1 - Ejecutando paso opcional personalizado")
    }
}

// Implementación Concreta 2
class ProcesadorConcreto2: ProcesadorProtocol {
    func paso1() {
        print("Procesador2 - Ejecutando paso 1 de manera diferente")
    }
    
    func paso2() {
        print("Procesador2 - Ejecutando paso 2 de manera diferente")
    }
    
    // No sobrescribe necesitaPasoOpcional() - usa el valor por defecto (false)
}

// Uso del patrón
let procesador1 = ProcesadorConcreto1()
print("--- Ejecutando Procesador 1 ---")
procesador1.ejecutarProceso()

let procesador2 = ProcesadorConcreto2()
print("\n--- Ejecutando Procesador 2 ---")
procesador2.ejecutarProceso()