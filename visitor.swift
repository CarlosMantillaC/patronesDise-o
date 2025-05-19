protocol VisitorFigura {
    func visitar(triangulo: Triangulo)
    func visitar(cuadrado: Cuadrado)
    func visitar(pentagono: Pentagono)
}

protocol Figura {
    func aceptar(visitor: VisitorFigura)
}

class Triangulo: Figura {
    let lado1: Double
    let lado2: Double
    let lado3: Double
    
    init(lado1: Double, lado2: Double, lado3: Double) {
        self.lado1 = lado1
        self.lado2 = lado2
        self.lado3 = lado3
    }
    
    func aceptar(visitor: VisitorFigura) {
        visitor.visitar(triangulo: self)
    }
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
    
    func visitar(triangulo: Triangulo) {
        totalLados += triangulo.lado1 + triangulo.lado2 + triangulo.lado3
    }
    
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

let triangulo = Triangulo(lado1: 3, lado2: 4, lado3: 5)
let cuadrado = Cuadrado(lado: 6)
let pentagono = Pentagono(lado: 2)

let visitorSuma = VisitorSumarLados()

let figuras: [Figura] = [triangulo, cuadrado, pentagono]
for figura in figuras {
    figura.aceptar(visitor: visitorSuma)
}

print("Suma de lados: \(visitorSuma.obtenerTotal())")

let visitorTriangulo = VisitorSumarLados()

triangulo.aceptar(visitor: visitorTriangulo)

print(visitorTriangulo.obtenerTotal())