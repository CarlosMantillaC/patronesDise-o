let closure = { (nombre: String) in
    print("Hola, \(nombre)")
}
closure("Carlos")


let sumar = { (a: Int, b: Int) -> Int in return a + b 
}

let suma2 = 
print(sumar(2, 3))

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