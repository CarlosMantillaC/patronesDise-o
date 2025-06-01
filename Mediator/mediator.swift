/*
Categoria: Comportamental
Proposito: Definir un objeto que encapsula como interactuan un conjunto de objetos,
promoviendo un bajo acoplamiento.
Como funciona:
Los objetos no se comunican directamente, sino a traves del mediador.
Ejemplo:
Un sistema de chat donde el mediador gestiona la comunicación entre usuarios.
*/

class ChatMediador {
    
    var usuarios: [Usuario] = []
    
    func agregarUsuario(usuario: Usuario) {
        usuarios.append(usuario)
    }
    
    func enviarMensajeAUsuarios(mensaje: String, emisor: Usuario) {
        for usuario in usuarios {
            if usuario != emisor {
                usuario.recibir(mensaje: mensaje, emisor: emisor)
            }
        }
    }
    
}

class Usuario: Equatable {
    
    var nombre = ""
    var mediador: ChatMediador
    
    init(nombre: String = "", mediador: ChatMediador) {
        self.nombre = nombre
        self.mediador = mediador
    }
    
    func enviar(mensaje: String) {
        mediador.enviarMensajeAUsuarios(mensaje: mensaje, emisor: self)
    }
    
    func recibir(mensaje: String, emisor: Usuario) {
        print("[\(nombre)] recibió \(mensaje) de \(emisor.nombre)")
    }
    
    static func == (usuario1: Usuario, usuario2: Usuario) -> Bool {
        return usuario1.nombre == usuario2.nombre
    }
    
}


let chat1 = ChatMediador()

let jose = Usuario(nombre: "jose", mediador: chat1)
let juan = Usuario(nombre: "juan", mediador: chat1)

chat1.agregarUsuario(usuario: jose)
chat1.agregarUsuario(usuario: juan)

jose.enviar(mensaje: "hola juan")
juan.enviar(mensaje: "hola jose, como estas?")