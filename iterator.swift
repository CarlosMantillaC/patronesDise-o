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
    var libros: [Libro]

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

class BibliotecaIterator {
    var biblioteca: Biblioteca
    var posicionActual: Int

    init(biblioteca: Biblioteca) {
        self.biblioteca = biblioteca
        self.posicionActual = 0
    }

    func hayMasLibros() -> Bool {
        return self.posicionActual < self.biblioteca.contarLibros()
    }

    func siguienteLibro() -> Libro? {
        if self.hayMasLibros() {
            let libro = self.biblioteca.getLibroEn(posicion: self.posicionActual)
            self.posicionActual += 1
            return libro
        } else {
            return nil
        }
    }
}

let lista = Biblioteca()
lista.agregarLibro(libro: Libro(titulo: "El Quijote"))
lista.agregarLibro(libro: Libro(titulo: "Cien años de soledad"))
lista.agregarLibro(libro: Libro(titulo: "Crónica de una muerte anunciada"))

let iterator = BibliotecaIterator(biblioteca: lista)
while iterator.hayMasLibros() {
    if let libro = iterator.siguienteLibro() {
        print(libro.getTitulo())
    }
}
