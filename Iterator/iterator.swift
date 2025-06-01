class Libro {
    
    var titulo = ""
    
    init(titulo: String) {
        self.titulo = titulo
    }
    
    func obtenerTitulo() {
        print(titulo)
    }
}

class Biblioteca {
    
    var libros: [Libro] = []
    
    func agregarLibro(libro: Libro) {
        libros.append(libro)
        
    }
    
    func cantidadLibro() -> Int {
        return libros.count
    }
    
}

class Iterador {
    
    var biblioteca: Biblioteca
    var indiceActual: Int = 0
    
    init(biblioteca: Biblioteca) {
        self.biblioteca = biblioteca
    }
    
    func siHayMas() -> Bool {
        return indiceActual < biblioteca.cantidadLibro()
    }
    
    func siguienteLibro() -> Libro? {
        guard siHayMas() else {
            return nil
        }
        let libro = biblioteca.libros[indiceActual]
        indiceActual += 1
        return libro
    }
    
}

let biblioteca = Biblioteca()

biblioteca.agregarLibro(libro: Libro(titulo: "cien años de soledad"))
biblioteca.agregarLibro(libro: Libro(titulo: "harry potter"))
biblioteca.agregarLibro(libro: Libro(titulo: "no se xd"))

let iterador = Iterador(biblioteca: biblioteca)

while iterador.siHayMas() {
    iterador.siguienteLibro()?.obtenerTitulo()
}
