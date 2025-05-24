// Protocolo simple sin associatedtype
protocol Iterador {
    func hayMas() -> Bool
    func siguiente() -> Libro?
}

class Libro {
    var titulo: String
    
    init(titulo: String) {
        self.titulo = titulo
    }
    
    func getTitulo() -> String {
        return self.titulo
    }
}

class Biblioteca {
    private var libros: [Libro]
    
    init() {
        self.libros = []
    }
    
    func agregarLibro(libro: Libro) {
        self.libros.append(libro)
    }
    
    func contarLibros() -> Int {
        return self.libros.count
    }
    
    func getLibroEn(posicion: Int) -> Libro {
        return self.libros[posicion]
    }
}

class BibliotecaIterator: Iterador {
    private let biblioteca: Biblioteca
    private var posicionActual: Int = 0
    
    init(biblioteca: Biblioteca) {
        self.biblioteca = biblioteca
    }
    
    func hayMas() -> Bool {
        return posicionActual < biblioteca.contarLibros()
    }
    
    func siguiente() -> Libro? {
        if hayMas() {
            let libro = biblioteca.getLibroEn(posicion: posicionActual)
            posicionActual += 1
            return libro
        }
        return nil
    }
}

// Uso
let biblioteca = Biblioteca()
biblioteca.agregarLibro(libro: Libro(titulo: "El Quijote"))
biblioteca.agregarLibro(libro: Libro(titulo: "Cien años de soledad"))
biblioteca.agregarLibro(libro: Libro(titulo: "Crónica de una muerte anunciada"))

let iterador: Iterador = BibliotecaIterator(biblioteca: biblioteca)

while iterador.hayMas() {
    if let libro = iterador.siguiente() {
        print(libro.getTitulo())
    }
}
