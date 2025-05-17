protocol JuguetesAcciones {
    func encender()
}

class Juguete {
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

func factoryJuguetes(tipo: String) -> JuguetesAcciones? {
    if tipo == "carro" {
        return Carro()
    } else if tipo == "muñeca" {
        return Muñeca()
    }
    return nil
}

if let carro = factoryJuguetes(tipo: "carro") {
    carro.encender()
} 

if let muñeca = factoryJuguetes(tipo: "muñeca"){
    muñeca.encender()
}

