class ChatMediador {
    
    var usuarios: [Usuario] = []
    
    func agregarUsuarios(usuario: Usuario) {
        
        usuarios.append(usuario)
        
    }
    
    func enviarMensaje(mensaje: String, emisor: Usuario) {
        for usuario in usuarios {
            if usuario === emisor {
                continue
            }
            usuario.recibir(mensaje: mensaje, emisor: emisor)
        }
    }
    
    
}

class Usuario {
    
    var nombre: String
    var mediador: ChatMediador
    
    init(nombre: String, mediador: ChatMediador) {
        self.nombre = nombre
        self.mediador = mediador
    }
    
    func enviar(mensaje: String) {
        mediador.enviarMensaje(mensaje: mensaje, emisor: self)
    }
    
    func recibir(mensaje: String, emisor: Usuario) {
        if emisor === self {
            return
        }
        print("\(nombre) recibió \(mensaje) por parte de \(emisor.nombre)")
        
    }
    
}

let chat1 = ChatMediador()

let juan = Usuario(nombre: "juan", mediador: chat1)
let jose = Usuario(nombre: "jose", mediador: chat1)

chat1.agregarUsuarios(usuario: juan)
chat1.agregarUsuarios(usuario: jose)

juan.enviar(mensaje: "holaaaa JOSE")
juan.recibir(mensaje: "qjaja", emisor: juan)
