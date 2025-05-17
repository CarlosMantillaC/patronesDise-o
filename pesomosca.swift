class Circulo {
    private let color: String 

    init(color: String) {
        self.color = color
    }

    func dibujar(x: Int, y: Int, radio: Int) {
        print("Dibujando un círculo \(color) en (\(x), \(y)) con radio \(radio)")
    }
}

class FabricaCirculos {
    private var circulos: [String: Circulo] = [:]

    func obtenerCirculo(color: String) -> Circulo {
        if let existente = circulos[color] {
            return existente
        } else {
            let nuevo = Circulo(color: color)
            circulos[color] = nuevo
            return nuevo
        }
    }
}

let fabrica = FabricaCirculos()

let rojo1 = fabrica.obtenerCirculo(color: "Rojo")
rojo1.dibujar(x: 10, y: 20, radio: 5)

let rojo2 = fabrica.obtenerCirculo(color: "Rojo")
rojo2.dibujar(x: 15, y: 25, radio: 10)

let azul = fabrica.obtenerCirculo(color: "Azul")
azul.dibujar(x: 30, y: 40, radio: 7)

print(rojo1 === rojo2)