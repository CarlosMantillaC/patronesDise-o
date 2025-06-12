protocol Acciones {
    
    func encender()
}

class Juguete {
    
    var material: String = "Plastico"
}

class Carro: Juguete, Acciones {
    
    func encender() {
        print("carro encendiendo")
    }
}

class Muneca: Juguete, Acciones {
    
    func encender() {
        print("muñeca encendiendo")
    }
}

func factory(tipo: String) -> (Juguete & Acciones)? {
    
    switch tipo.lowercased() {
    case "carro":
        return Carro()
    case "muñeca":
        return Muneca()
    default:
        return nil
    }
}


if let carro = factory(tipo: "carro") {
    carro.encender()
    print(carro.material)
}

if let muneca = factory(tipo: "muñeca") {
    muneca.encender()
    print(muneca.material)
}
