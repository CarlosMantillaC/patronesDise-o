protocol EstrategiaPago {
    
    func pagar(monto: Double)
}

class Tarjeta: EstrategiaPago {
    
    func pagar(monto: Double) {
        print("pagando con tarjeta el monto \(monto)")
    }
    
}

class Efectivo: EstrategiaPago {
    
    func pagar(monto: Double) {
        print("pagando en efectivo el monto \(monto)")
    }
}

class Carrito {
    
    var estrategia: EstrategiaPago
    
    init(estrategia: EstrategiaPago) {
        self.estrategia = estrategia
    }
    
    func pagar(monto: Double) {
        
        estrategia.pagar(monto: monto)
    }
}


let carrito = Carrito(estrategia: Efectivo())

carrito.pagar(monto: 100)
