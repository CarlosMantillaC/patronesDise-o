protocol Prototipo {
    func clonar() -> Personaje
}

protocol Personaje {
    var nombre: String { get set }
    var arma: String { get set}
    var poder: String { get set}
}

class Guerrero: Personaje, Prototipo {
    
    var nombre: String
    var arma: String
    var poder: String
    
    init(nombre: String, arma: String, poder: String) {
        self.nombre = nombre
        self.arma = arma
        self.poder = poder
    }
    
    func clonar() -> Personaje {
        return Guerrero(nombre: self.nombre, arma: self.arma, poder: self.poder)
    }
}

class Render {
    
    func renderPersonaje(personaje: Personaje) {
        
        print(personaje.nombre, personaje.arma, personaje.poder)
    }
}

var guerrero1 = Guerrero(nombre: "juan", arma: "arma1", poder: "poder1")

let render = Render()
render.renderPersonaje(personaje: guerrero1)

var guerrero2 = guerrero1.clonar()
guerrero2.nombre = "ds"

render.renderPersonaje(personaje: guerrero2)


if let clon = guerrero2 as? Guerrero {
    print(guerrero1 === clon)
}
