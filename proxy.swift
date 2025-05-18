// 1. Definimos el protocolo que actuará como interfaz común
protocol Sujeto {
    func solicitud()
}

// 2. Implementación del Sujeto Real
class SujetoReal: Sujeto {
    func solicitud() {
        print("SujetoReal: Procesando la solicitud real.")
    }
}

// 3. Implementación del Proxy
class Proxy: Sujeto {
    private var sujetoReal: SujetoReal?
    
    func solicitud() {
        // Lazy initialization - creamos el sujeto real solo cuando es necesario
        if sujetoReal == nil {
            sujetoReal = SujetoReal()
            print("Proxy: Creando instancia de SujetoReal.")
        }
        
        // Podemos agregar lógica adicional antes y después de la llamada
        print("Proxy: Verificando acceso antes de la solicitud.")
        
        sujetoReal?.solicitud()
        
        print("Proxy: Registrando actividad después de la solicitud.")
    }
    
    // Método adicional para demostrar funcionalidad extra del proxy
    func verificarAcceso() -> Bool {
        print("Proxy: Verificando permisos de acceso...")
        // Simulamos una verificación de acceso
        return true
    }
}

// 4. Código del cliente
class Cliente {
    static func ejecutar(sujeto: Sujeto) {
        print("Cliente: Ejecutando operación a través del proxy/sujeto.")
        sujeto.solicitud()
    }
}

// 5. Uso del patrón
let proxy = Proxy()
Cliente.ejecutar(sujeto: proxy)
