protocol VisitorFigura {
    func visitar(cuadrado: Cuadrado)
    func visitar(pentagono: Pentagono)
}

protocol Figura {
    func aceptar(visitor: VisitorFigura)
}

class Cuadrado: Figura {
    let lado: Double
    
    init(lado: Double) {
        self.lado = lado
    }
    
    func aceptar(visitor: VisitorFigura) {
        visitor.visitar(cuadrado: self)
    }
}

class Pentagono: Figura {
    let lado: Double
    
    init(lado: Double) {
        self.lado = lado
    }
    
    func aceptar(visitor: VisitorFigura) {
        visitor.visitar(pentagono: self)
    }
}

class VisitorSumarLados: VisitorFigura {
    private var totalLados: Double = 0
    
    func visitar(cuadrado: Cuadrado) {
        totalLados += cuadrado.lado * 4
    }
    
    func visitar(pentagono: Pentagono) {
        totalLados += pentagono.lado * 5
    }
    
    func obtenerTotal() -> Double {
        return totalLados
    }
}

let cuadrado = Cuadrado(lado: 6)
let pentagono = Pentagono(lado: 2)

let visitorSuma = VisitorSumarLados()

let figuras: [Figura] = [cuadrado, pentagono]
for figura in figuras {
    figura.aceptar(visitor: visitorSuma)
}

print("Suma de lados: \(visitorSuma.obtenerTotal())")

let visitorCuadrado = VisitorSumarLados()

cuadrado.aceptar(visitor: visitorCuadrado)

print(visitorCuadrado.obtenerTotal())