protocol FiguraVisitor {
    func visitarCirculo(circulo: Circulo)
    func visitarRectangulo(rectangulo: Rectangulo)
}

protocol Figura {
    func aceptarVisitor(visitor: FiguraVisitor)
}

class Circulo: Figura {
    
    var radio: Double
    
    init(radio: Double) {
        self.radio = radio
    }
    
    func aceptarVisitor(visitor: FiguraVisitor) {
        visitor.visitarCirculo(circulo: self)
    }
    
}

class Rectangulo: Figura {
    
    var alto: Double
    var ancho: Double
    
    init(alto: Double, ancho: Double) {
        self.alto = alto
        self.ancho = ancho
    }
    
    func aceptarVisitor(visitor: FiguraVisitor) {
        visitor.visitarRectangulo(rectangulo: self)
    }
    
}

class CalcularArea: FiguraVisitor {
    
    var area: Double = 0
    
    func visitarCirculo(circulo: Circulo) {
        area = 3.14 * (circulo.radio * circulo.radio)
        print("Área del círculo: \(area)")
    }
    
    func visitarRectangulo(rectangulo: Rectangulo) {
        area = rectangulo.ancho * rectangulo.alto
        print("Área del rectángulo: \(area)")
    }
}

let calcularArea = CalcularArea()

let circulo = Circulo(radio: 2)
let rectangulo = Rectangulo(alto: 3, ancho: 3)

calcularArea.visitarCirculo(circulo: circulo)
circulo.aceptarVisitor(visitor: calcularArea)

calcularArea.visitarRectangulo(rectangulo: rectangulo)
rectangulo.aceptarVisitor(visitor: calcularArea)
