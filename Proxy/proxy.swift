protocol Video {
    
    func reproducir()
}

class VideoPrivado: Video {
    
    var titulo: String
    
    init(titulo: String) {
        self.titulo = titulo
    }
    
    func reproducir() {
        print("reproduciendo \(titulo)")
    }
}

class VideoProxy: Video {
    
    var usuario: String
    var videoReal: Video
    var usuariosPermitidos: [String]
    
    init(usuario: String, videoReal: Video, usuariosPermitidos: [String]) {
        self.usuario = usuario
        self.videoReal = videoReal
        self.usuariosPermitidos = usuariosPermitidos
    }
    
    func reproducir() {
        if usuariosPermitidos.contains(usuario) {
            videoReal.reproducir()
        }
    }
}


let videoReal = VideoPrivado(titulo: "video Privado")

let usuariosPermitidos = ["admin", "user1", "user2"]

let videoProxy = VideoProxy(usuario: "admin", videoReal: videoReal, usuariosPermitidos: usuariosPermitidos)
videoProxy.reproducir()
