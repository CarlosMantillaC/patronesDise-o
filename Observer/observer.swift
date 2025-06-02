protocol Observador {
    func actualizar(mensaje: String)
}

protocol Sujeto {
    func agregarObservador(obs: Observador)
    func notificarObservadores(mensaje: String)
}

class CanalYoutube: Sujeto {
    
    var nombre = ""
    var observadores: [Observador] = []
    
    init(nombre: String) {
        self.nombre = nombre
    }
    
    func agregarObservador(obs: any Observador) {
        observadores.append(obs)
    }
    
    func notificarObservadores(mensaje: String) {
        for obs in observadores {
            obs.actualizar(mensaje: "[\(nombre)] \(mensaje)")
        }
    }
    
    func subirVideo(titulo: String) {
        notificarObservadores(mensaje: "Nuevo video: \(titulo)")
    }
    
}

class UsuarioEmail: Observador {
    
    var nombre = ""
    
    init(nombre: String = "") {
        self.nombre = nombre
    }
    
    func actualizar(mensaje: String) {
        print("[EMAIL] \(nombre) recibió: \(mensaje)")
    }
}

class UsuarioSms: Observador {
    
    var nombre = ""

    init(nombre: String = "") {
        self.nombre = nombre
    }
    
    func actualizar(mensaje: String) {
        print("[SMS] \(nombre) recibió: \(mensaje)")
    }
}

let canal = CanalYoutube(nombre: "SwiftBeta")

canal.agregarObservador(obs: UsuarioSms(nombre: "Ana"))
canal.agregarObservador(obs: UsuarioEmail(nombre: "Ana"))

canal.subirVideo(titulo: "Patron Observer")

