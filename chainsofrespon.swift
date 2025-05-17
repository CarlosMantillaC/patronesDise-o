protocol ManejarMonto {
    var siguiente: ManejarMonto? { get set }
    func autorizar(monto: Double)
    func pasarSiguiente(monto: Double)
}

class Empleado: ManejarMonto {
    var siguiente: ManejarMonto?
    
    func autorizar(monto: Double) {
        if monto <= 1000 {
            print("✅ Monto de \(monto) autorizado por el empleado.")
        } else {
            pasarSiguiente(monto: monto)
        }
    }
    
    func pasarSiguiente(monto: Double) {
        print("➡️ El empleado pasa el monto de \(monto) al supervisor.")
        siguiente?.autorizar(monto: monto)
    }
}

class Supervisor: ManejarMonto {
    var siguiente: ManejarMonto?
    
    func autorizar(monto: Double) {
        if monto <= 5000 {
            print("✅ Monto de \(monto) autorizado por el supervisor.")
        } else {
            pasarSiguiente(monto: monto)
        }
    }
    
    func pasarSiguiente(monto: Double) {
        print("➡️ El supervisor pasa el monto de \(monto) al gerente.")
        siguiente?.autorizar(monto: monto)
    }
}

class Gerente: ManejarMonto {
    var siguiente: ManejarMonto? = nil
    
    func autorizar(monto: Double) {
        if monto <= 10000 {
            print("✅ Monto de \(monto) autorizado por el gerente.")
        } else {
            pasarSiguiente(monto: monto)
        }
    }
    
    func pasarSiguiente(monto: Double) {
        print("❌ Monto de \(monto) no puede ser autorizado por nadie.")
    }
}
let empleado = Empleado()
let supervisor = Supervisor()
let gerente = Gerente()

empleado.siguiente = supervisor
supervisor.siguiente = gerente

empleado.autorizar(monto: 700)     
empleado.autorizar(monto: 3000)
empleado.autorizar(monto: 7500)
empleado.autorizar(monto: 20000)