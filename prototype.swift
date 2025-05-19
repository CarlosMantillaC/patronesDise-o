protocol Prototype {
    func clone() -> Self
}

class Producto: Prototype {
    var nombre: String
    var precio: Double
    
    required init(nombre: String, precio: Double) {
        self.nombre = nombre
        self.precio = precio
    }
    
    func clone() -> Self {
        return Self(nombre: self.nombre, precio: self.precio)
    }
}

let productoOriginal = Producto(nombre: "iPhone", precio: 999.99)
let productoClonado = productoOriginal.clone()

productoClonado.nombre = "iPhone Pro"
productoClonado.precio = 1299.99

let productoClonado2 = productoOriginal.clone()

print("Original: \(productoOriginal.nombre) - \(productoOriginal.precio)")
print("Clonado: \(productoClonado.nombre) - \(productoClonado.precio)")
print("Clonado2: \(productoClonado2.nombre) - \(productoClonado2.precio)")
print("Es igual al original? \(productoOriginal === productoClonado2)")