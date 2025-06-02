class Memento {
    
    private let estado: String

    init(estado: String) {
        self.estado = estado
    }

    func obtenerEstado() -> String {
        return estado
    }
    
}

class EditorTexto {
    
    var contenido = ""
    
    func agregarContenido(texto: String) {
        contenido += texto
    }
    
    func mostrar() {
        print(contenido)
    }
    
    func crearMemento() -> Memento {
        return Memento(estado: contenido)
    }
    
    func restaurar(_ memento: Memento) {
        contenido = memento.obtenerEstado()
    }
    
}

class Historial {
    
    var cambios: [Memento] = []
    
    func guardar(_ memento: Memento) {
        cambios.append(memento)
    }
    
    func deshacer() -> Memento? {
        return cambios.popLast()
    }
}


var editor = EditorTexto()
var historial = Historial()

editor.agregarContenido(texto: "Hola ")
historial.guardar(editor.crearMemento())
editor.mostrar()

editor.agregarContenido(texto: "Mundo ")
historial.guardar(editor.crearMemento())
editor.mostrar()

editor.agregarContenido(texto: "Cruel ")
historial.guardar(editor.crearMemento())
editor.mostrar()

if let deshacer = historial.deshacer() {
    editor.restaurar(deshacer)
}
editor.mostrar()

if let deshacer = historial.deshacer() {
    editor.restaurar(deshacer)
}
editor.mostrar()