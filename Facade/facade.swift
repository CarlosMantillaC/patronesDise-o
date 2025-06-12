class Pantalla {
    func bajar() {
        print("Pantalla bajada")
    }
    
    func subir() {
        print("Pantalla subida")
    }
}


class Proyector {
    func encender() {
        print("Proyector encendido")
    }
    
    func apagar() {
        print("Proyector apagado")
    }
}


class SistemaSonido {
    func encender() {
        print("Sistema de sonido encendido")
    }
    
    func apagar() {
        print("Sistema de sonido apagado")
    }
    
    func ajustarVolumen(nivel: Int) {
        print("Volumen ajustado a \(nivel)")
    }
}


class Luces {
    func encender() {
        print("Luces encendidas")
    }
    
    func apagar() {
        print("Luces apagadas")
    }
}


class CineEnCasa {
    
    let pantalla = Pantalla()
    let proyector = Proyector()
    let sistemaSonido = SistemaSonido()
    let luces = Luces()
    
    func iniciarPelicula() {
        pantalla.subir()
        proyector.encender()
        sistemaSonido.encender()
        sistemaSonido.ajustarVolumen(nivel: 80)
        luces.encender()
    }
    
    func terminarPelicula() {
        pantalla.bajar()
        proyector.apagar()
        sistemaSonido.apagar()
        luces.apagar()
    }
    
}

let cine = CineEnCasa()

cine.iniciarPelicula()
print("-----------\n")
cine.terminarPelicula()
