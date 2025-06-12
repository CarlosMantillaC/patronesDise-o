protocol Luz {
    
    func encender()
    func apagar()
}

class LuzBasica: Luz {
    
    func encender() {
        print("luz encendida")
    }
    
    func apagar() {
        print("luz apagada")
    }
    
}

protocol Puerta {
    
    func abrirPuerta()
    func cerrarPuerta()
    
}

class PuertaBasica: Puerta {
    
    func abrirPuerta() {
        print("abriendo puerta")
    }
    
    func cerrarPuerta() {
        print("cerrando puerta")
    }
}

protocol Comando {
    
    func ejecutar()
}

class EncenderLuz: Comando {
    
    var luz: Luz
    
    init(luz: Luz) {
        self.luz = luz
    }
    
    func ejecutar() {
        luz.encender()
    }
}

class ApagarLuz: Comando {
    
    var luz: Luz
    
    init(luz: Luz) {
        self.luz = luz
    }
    
    func ejecutar() {
        luz.apagar()
    }
}

class AbrirPuerta: Comando {
    
    var puerta: Puerta
    
    init(puerta: Puerta) {
        self.puerta = puerta
    }
    
    func ejecutar() {
        puerta.abrirPuerta()
    }
}

class CerrarPuerta: Comando {
    
    var puerta: Puerta
    
    init(puerta: Puerta) {
        self.puerta = puerta
    }
    
    func ejecutar() {
        puerta.cerrarPuerta()
    }
}

class ControlRemoto {
    
    var comando: Comando
    
    init(comando: Comando) {
        self.comando = comando
    }
    
    func presionarButon() {
        comando.ejecutar()
    }
}

let luz = LuzBasica()

let encenderLuz = EncenderLuz(luz: luz)

let puerta = PuertaBasica()

let abrirPuera = AbrirPuerta(puerta: puerta)

let controlRemoto = ControlRemoto(comando: abrirPuera)
controlRemoto.presionarButon()
