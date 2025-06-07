class Libro {
    var titulo: String
    
    init(titulo: String) {
        self.titulo = titulo
    }
}

class LibreriaDigital {
    
    var libros: [Libro] = [
        Libro(titulo: "harry potter"),
        Libro(titulo: "el poder del ahora"),
        Libro(titulo: "despues de diciembre"),
        Libro(titulo: "clean code"),
    ]
}


protocol ComprobanteCompra {
    var libro: Libro? { get set }
    func obtenerLibro(libro: Libro)
    func comprar()
}

class ComprobantePDF: ComprobanteCompra {
    
    var libro: Libro?
    
    func obtenerLibro(libro: Libro) {
        self.libro = libro
    }
    
    func comprar() {
        print ("PDF: comprando el libro \(libro?.titulo ?? "")")
    }
}


protocol MetodoPago {
    func pagar()
}


class Efectivo: MetodoPago {
    
    func pagar() {
        print("pagando en efectivo")
    }
}


protocol Notificar {
    
    func notificacion(compra: ComprobanteCompra)
}


class Email: Notificar {
    
    func notificacion(compra: ComprobanteCompra) {
        print("EMAIL: has comprado el libro \(compra.libro?.titulo ?? "")")
    }
}


var libreria = LibreriaDigital()

var libro1 = libreria.libros[0]

var comprobanteCompraPDF = ComprobantePDF()
comprobanteCompraPDF.obtenerLibro(libro: libro1)
comprobanteCompraPDF.comprar()

var efectivo = Efectivo()
efectivo.pagar()

var email = Email()

email.notificacion(compra: comprobanteCompraPDF)
