protocol Bebida {
    
    func obtenerDescripcion() -> String
    func obtenerPrecio() -> Int
}

class Cafe: Bebida {
    
    func obtenerDescripcion() -> String {
        return "cafe"
    }
    
    func obtenerPrecio() -> Int {
        return 5
    }
    
}

class Te: Bebida {
    
    func obtenerDescripcion() -> String {
        return "te"
    }
    
    func obtenerPrecio() -> Int {
        return 2
    }
    
}

class Leche: Bebida {
    
    var bebida: Bebida
    
    init(bebida: Bebida) {
        self.bebida = bebida
    }
    
    func obtenerDescripcion() -> String {
        cafe.obtenerDescripcion() + " con leche"
    }
    
    func obtenerPrecio() -> Int {
        cafe.obtenerPrecio() + 3
    }
    
}

let cafe = Cafe()

let leche = Leche(bebida: cafe)

print(cafe.obtenerDescripcion())
print(leche.obtenerDescripcion())
print(leche.obtenerPrecio())
