// Protocolo Motor (Target)
protocol Motor {
    func acelerar()
    func apagar()
    func arrancar()
    func cargarCombustible()
}

// Clase MotorNaftero (ConcreteTarget)
class MotorNaftero: Motor {
    func acelerar() {
        print("Acelerando motor naftero")
    }
    
    func apagar() {
        print("Apagando motor naftero")
    }
    
    func arrancar() {
        print("Arrancando motor naftero")
    }
    
    func cargarCombustible() {
        print("Cargando nafta en el motor")
    }
}

// Clase MotorElectrico (Adaptee)
class MotorElectrico {
    func activar() {
        print("Activando motor eléctrico")
    }
    
    func conectar() {
        print("Conectando motor eléctrico")
    }
    
    func desconectar() {
        print("Desconectando motor eléctrico")
    }
    
    func enchufar() {
        print("Enchufando motor eléctrico")
    }
    
    func mover() {
        print("Moviendo motor eléctrico")
    }
    
    func parar() {
        print("Parando motor eléctrico")
    }

    func cargar() {
        print("Cargando batería del motor eléctrico")
    }
}

// Clase ElectricoAdapter (Adapter)
class ElectricoAdapter: Motor {
    private let motorElectrico: MotorElectrico
    
    init() {
        self.motorElectrico = MotorElectrico()
    }
    
    func acelerar() {
        motorElectrico.mover()
    }
    
    func apagar() {
        motorElectrico.parar()
        motorElectrico.desconectar()
    }
    
    func arrancar() {
        motorElectrico.enchufar()
        motorElectrico.conectar()
        motorElectrico.activar()
    }
    
    func cargarCombustible() {
        motorElectrico.cargar()  
    }
}

// Ejemplo de uso
func main() {
    print("--- Usando motor naftero ---")
    let motor1: Motor = MotorNaftero()
    motor1.arrancar()
    motor1.acelerar()
    motor1.cargarCombustible()
    motor1.apagar()
    
    print("\n--- Usando motor eléctrico a través del adapter ---")
    let motor2: Motor = ElectricoAdapter()
    motor2.arrancar()    // Esto llama a enchufar(), conectar() y activar()
    motor2.acelerar()    // Esto llama a mover()
    motor2.cargarCombustible() // Mensaje especial para eléctrico
    motor2.apagar()      // Esto llama a parar() y desconectar()
}

// Ejecutar el ejemplo
main()