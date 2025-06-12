protocol Componente {
    
    var nombre: String { get set }
    func mostrar()
}

class Archivo: Componente {
    var nombre: String
    
    init(nombre: String) {
        self.nombre = nombre
    }
    
    func mostrar() {
        print("mostrando archivo \(nombre)")
    }
}

class Carpeta: Componente {
    
    var nombre: String
    var componentes: [Componente] = []
    
    init(nombre: String) {
        self.nombre = nombre
    }
    
    func agregarComponente(componente: Componente) {
        
        componentes.append(componente)
    }
    
    func mostrar() {
        print("mostrando carpeta \(nombre)")
        for componente in componentes {
            componente.mostrar()
        }
    }
}

let archivo1 = Archivo(nombre: "archivo1")
let archivo2 = Archivo(nombre: "archivo2")
let archivo3 = Archivo(nombre: "archivo3")

let carpeta1 = Carpeta(nombre: "carpeta1")
let carpeta2 = Carpeta(nombre: "carpeta2")

carpeta1.agregarComponente(componente: archivo1)
carpeta1.agregarComponente(componente: archivo2)

carpeta2.agregarComponente(componente: archivo3)

carpeta1.agregarComponente(componente: carpeta2)

carpeta1.mostrar()
