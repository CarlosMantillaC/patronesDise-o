protocol State {
    
    func play()
    func pause()
    func stop()
    
}


class EstadoReproduciendo: State {
    
    var reproductor: Reproductor
    
    init(reproductor: Reproductor) {
        self.reproductor = reproductor
    }
    
    
    func play() {
        print("ya está reproduciendo")
    }
    
    func pause() {
        print("pausando")
        reproductor.establecerEstado(nuevoEstado: EstadoPausado(reproductor: reproductor))
    }
    
    func stop() {
        print("deteniendo")
        reproductor.establecerEstado(nuevoEstado: EstadoDetenido(reproductor: reproductor))
    }
    
}

class EstadoPausado: State {
    
    var reproductor: Reproductor
    
    init(reproductor: Reproductor) {
        self.reproductor = reproductor
    }
    
    
    func play() {
        print("reproduciendo")
        reproductor.establecerEstado(nuevoEstado: EstadoReproduciendo(reproductor: reproductor))
    }
    
    func pause() {
        print("ya esta pausado")
    }
    
    func stop() {
        print("deteniendo")
        reproductor.establecerEstado(nuevoEstado: EstadoDetenido(reproductor: reproductor))
    }
    
}

class EstadoDetenido: State {
    
    var reproductor: Reproductor
    
    init(reproductor: Reproductor) {
        self.reproductor = reproductor
    }
    
    func play() {
        print("reproduciendo")
        reproductor.establecerEstado(nuevoEstado: EstadoReproduciendo(reproductor: reproductor))
    }
    
    func pause() {
        print("pausando")
        reproductor.establecerEstado(nuevoEstado: EstadoPausado(reproductor: reproductor))
    }
    
    func stop() {
        print("ya esta detenido")
    }
    
}


protocol Reproductor {
    func establecerEstado(nuevoEstado: State)
}

class ReproductorMusica: Reproductor {
    
    private var estado: State?

    init() {
        establecerEstado(nuevoEstado: EstadoDetenido(reproductor: self))
    }

    func establecerEstado(nuevoEstado: State) {
        estado = nuevoEstado
    }
    
    func play() {
        estado?.play()
    }
    
    func pause() {
        estado?.pause()
    }
    
    func stop() {
        estado?.stop()
    }
}


var reproductor = ReproductorMusica()

reproductor.stop()
reproductor.pause()
reproductor.pause()
reproductor.play()
reproductor.play()

