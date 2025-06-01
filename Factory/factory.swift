protocol JuguetesAcciones {
    func encender()
    func mostrarMaterial()
}

class Juguete {
    var material = "Plastico"
    
    func mostrarMaterial() {
        print(material)
    }
}

class Carro: Juguete, JuguetesAcciones {
    func encender() {
        print("El carro se ha encendido")
    }
}

class Muñeca: Juguete, JuguetesAcciones {
    func encender() {
        print("La muñeca se ha encendido")
    }
}

func factory(tipo: String) -> JuguetesAcciones? {

    switch tipo.lowercased() {
    case "carro":
        return Carro()
    case "muñeca":
        return Muñeca()
    default:
        return nil
    }
}

if let carro = factory(tipo: "carro") {
    carro.encender()
    carro.mostrarMaterial()
}
if let muñeca = factory(tipo: "muñeca") {
    muñeca.encender()
    muñeca.mostrarMaterial()
}