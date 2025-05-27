import Foundation

// MARK: - 1. Variables y Constantes

// Una variable puede cambiar su valor
var nombre = "Juan"
nombre = "Carlos" // válido

// Una constante no puede cambiar su valor
let edad = 30
// edad = 31 // ❌ Error: no se puede modificar una constante

// Declaración con tipo explícito
var apellido: String = "Pérez"
let pi: Double = 3.1416

// MARK: - 2. Estructuras (struct)

struct Persona {
    var nombre: String
    var edad: Int

    func saludar() {
        print("Hola, soy \(nombre) y tengo \(edad) años.")
    }
}

var persona1 = Persona(nombre: "Juan", edad: 25)
var persona2 = persona1
persona2.nombre = "Pedro"

print(persona1.nombre, persona1.edad) // Juan (no se ve afectado)
print(persona2.nombre, persona2.edad) // Pedro


// MARK: - 3. Clases (class) y Herencia

class Animal {
    var nombre: String

    init(nombre: String) {
        self.nombre = nombre
    }

    func hablar() {
        print("Soy un animal llamado \(nombre)")
    }
}

class Perro: Animal {
    override func hablar() {
        print("Guau! Me llamo \(nombre)")
    }
}

var miPerro = Perro(nombre: "Firulais")

var miPerro2 = miPerro
miPerro2.nombre = "Rex"
miPerro.hablar()

// MARK: - 4. Optionals (valores que pueden ser nil)

// Declaración de un optional
var nombreOptional: String? = "Luis"

// Desempaquetado seguro con if let
if let nombreDesempaquetado = nombreOptional {
    print("Hola, \(nombreDesempaquetado)")
}

// Desempaquetado seguro con guard let
func saludar(_ nombre: String?) {
    guard let nombreSeguro = nombre else {
        print("No se proporcionó nombre")
        return
    }
    print("Hola, \(nombreSeguro)")
}
saludar("Sandra")
saludar(nil)

// Desempaquetado por operador de coalescencia nula
func saludar2(_ nombre: String?) {
    var nombreSeguro = nombre ?? "invitado"
    print("Hola, \(nombreSeguro)")
}
saludar2("Sandraa")
saludar2(nil)

// Optional chaining
class Mascota {
    var nombre: String = "Pelusa"
}

class Dueño {
    var mascota: Mascota?
}

let dueño = Dueño()
let nombreMascota = dueño.mascota?.nombre // nil, porque mascota es nil
print(nombreMascota ?? "Sin mascota")

dueño.mascota = Mascota()
let nombreMascota2 = dueño.mascota?.nombre // "Pelusa"
print(nombreMascota2 ?? "Sin mascota")

// MARK: - 5. Funciones

// Función básica
func sumar(a: Int, b: Int) -> Int {
    return a + b
}

let resultadoSuma = sumar(a: 5, b: 3)
print("Resultado de sumar: \(resultadoSuma)")

// Función con nombres externos/internos
func restar(_ a: Int, menos b: Int) -> Int {
    return a - b
}
print(restar(10, menos: 4)) // 6

// Parámetros con valores por defecto
func mostrarSaludo(_ mensaje: String = "Hola") {
    print(mensaje)
}
mostrarSaludo()
mostrarSaludo("Buenos días")

// MARK: - 6. Protocolos

// Un protocolo define un contrato
protocol Describible {
    func descripcion() -> String
}

// Conformidad al protocolo
struct Vehiculo: Describible {
    var marca: String

    func descripcion() -> String {
        return "Vehículo marca \(marca)"
    }
}

let carro = Vehiculo(marca: "Toyota")
print(carro.descripcion())

// MARK: - 7. Closures

// Closure básico
let saludarClosure = { 
    (nombre: String) -> String in
    return "Hola, \(nombre)"
}
print(saludarClosure("Laura"))

// Función que recibe un closure
func operar(a: Int, b: Int, operacion: (Int, Int) -> Int) -> Int {
    return operacion(a, b)
}

// Uso de closure como argumento
let suma = operar(a: 3, b: 7, operacion: { (x, y) in x + y })
print("Suma con closure: \(suma)")

// Trailing closure
let multiplicacion = operar(a: 4, b: 5) { $0 * $1 }
print("Multiplicación con trailing closure: \(multiplicacion)")


let sumar = { 
    (a: Int, b: Int) -> Int in 
    return a + b
}
print(sumar(2, 3))


let sumar2: (Int, Int, Int) -> Int = { $0 + $1 + $2}
print(sumar2(2, 3, 5))
