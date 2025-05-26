let closure = { (nombre: String) in
    print("Hola, \(nombre)")
}
closure("Carlos")


let sumar = { (a: Int, b: Int) -> Int in return a + b
}
print(sumar(2, 3))


let sumar2: (Int, Int, Int) -> Int = { $0 + $1 + $2}
print(sumar2(2, 3, 5))


func aplicarOperacion(a: Int, b: Int, operacion: (Int, Int) -> Int) -> Int {
    return operacion(a, b)
}

let resultado = aplicarOperacion(a: 2, b: 3, operacion: {
    (x, y) in x * y
}
)

print(resultado)

func aplicarOperacion2(a: Int, b: Int, operacion: (Int, Int) -> Int) -> Int {
    return operacion(a, b)
}

let resultado2 = aplicarOperacion2(a:3, b:4, operacion: {
    (x,y) in x - y
})

print(resultado2)

func multiply (x: Int, y: Int) -> Int {
    return x * y
}
func perform (fn: (Int, Int) -> Int, a: Int, b: Int) -> Int {
    return fn(a, b)
}

let resultado4 = perform(fn: multiply, a:3, b:4)
print(resultado4)

func saludar(nombre: String?) {
    guard let nombreSeguro = nombre else {
        print("No hay nombre")
        return
    }
    print("Hola, \(nombreSeguro)")
}
saludar(nombre: "Carlos")


struct Rectangulo {
    var ancho: Double
    var alto: Double

    var area: Double {
        get {
            return ancho * alto
        }
        set(nuevaArea) {
            // Cambiamos el ancho para que mantenga el alto
            ancho = nuevaArea / alto
        }
    }
}
var r = Rectangulo(ancho: 4, alto: 2)

print(r.area)  // get: devuelve 8

r.area = 10     // set: cambia el ancho para que área sea 10
print(r.ancho)  // ahora ancho es 5.0, porque 10 / 2 = 5
