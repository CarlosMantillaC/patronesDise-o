protocol Notificador {
    func notificar(mensaje: String)
}

class SmsNotificador: Notificador {
    let usuario: String
    
    init (usuario: String) {
        self.usuario = usuario
    }

    func notificar(mensaje: String) {
        print("[SMS] Notificación a \(usuario): \(mensaje)")
    }

}

class EmailNotificador: Notificador {
    let usuario: String

    init(usuario: String) {
        self.usuario = usuario
    }

    func notificar(mensaje: String) {
        print("[EMAIL] Notificación a \(usuario): \(mensaje)")
    }
}

func crearNotificador(tipo: String, usuario: String) -> Notificador {
    switch tipo.lowercased() {
    case "email":
        return EmailNotificador(usuario: usuario)
    case "sms":
        return SmsNotificador(usuario: usuario)
    default:
        fatalError("Tipo de notificación no válido")
    }
}

class Usuario {
    let nombre: String
    let tipoNotificacion: String

    init(nombre: String, tipoNotificacion: String) {
        self.nombre = nombre
        self.tipoNotificacion = tipoNotificacion
    }

    func obtenerNotificador() -> Notificador {
        return crearNotificador(tipo: tipoNotificacion, usuario: nombre)
    }
}

class CanalYouTube {
    let nombre: String
    var suscriptores: [Notificador] = []

    init(nombre: String) {
        self.nombre = nombre
    }

    func agregarSuscriptor(_ notificador: Notificador) {
        suscriptores.append(notificador)
    }

    func subirVideo(titulo: String) {
        print("\n[\(nombre)] Nuevo video subido: \(titulo)")
        for sub in suscriptores {
            sub.notificar(mensaje: "Nuevo video: \(titulo)")
        }
    }
}

let canal = CanalYouTube(nombre: "TechMind")

let usuario1 = Usuario(nombre: "Ana", tipoNotificacion: "email")
let usuario2 = Usuario(nombre: "Luis", tipoNotificacion: "sms")

canal.agregarSuscriptor(usuario1.obtenerNotificador())
canal.agregarSuscriptor(usuario2.obtenerNotificador())

canal.subirVideo(titulo: "Observer Pattern en Swift")
