// Implementación (Dispositivos)
protocol Dispositivo {
    func encender()
    func apagar()
    func ajustarVolumen(_ nivel: Int)
}

class Televisor: Dispositivo {
    func encender() {
        print("TV encendida")
    }
    
    func apagar() {
        print("TV apagada")
    }
    
    func ajustarVolumen(_ nivel: Int) {
        print("Volumen TV ajustado a \(nivel)")
    }
}

class Radio: Dispositivo {
    func encender() {
        print("Radio encendida")
    }
    
    func apagar() {
        print("Radio apagada")
    }
    
    func ajustarVolumen(_ nivel: Int) {
        print("Volumen Radio ajustado a \(nivel)")
    }
}

// Abstracción (Controles remotos)
class ControlRemoto {
    fileprivate let dispositivo: Dispositivo
    
    init(dispositivo: Dispositivo) {
        self.dispositivo = dispositivo
    }
    
    func encender() {
        dispositivo.encender()
    }
    
    func apagar() {
        dispositivo.apagar()
    }
    
    func ajustarVolumen(_ nivel: Int) {
        dispositivo.ajustarVolumen(nivel)
    }
}

class ControlAvanzado: ControlRemoto {
    func mute() {
        ajustarVolumen(0)
        print("Dispositivo silenciado")
    }
    
    func subirVolumen() {
        // Podríamos añadir lógica específica aquí
        ajustarVolumen(10)
    }
}

// Uso del patrón Bridge
func demostracionBridge() {
        
    // Crear dispositivos
    let tv = Televisor()
    let radio = Radio()
    
    // Controles básicos
    let controlTV = ControlRemoto(dispositivo: tv)
    let controlRadio = ControlRemoto(dispositivo: radio)
    
    print("Usando control básico con TV:")
    controlTV.encender()
    controlTV.ajustarVolumen(15)
    controlTV.apagar()
    
    print("\nUsando control básico con Radio:")
    controlRadio.encender()
    controlRadio.ajustarVolumen(8)
    controlRadio.apagar()
}

// Ejecutar la demostración
demostracionBridge()