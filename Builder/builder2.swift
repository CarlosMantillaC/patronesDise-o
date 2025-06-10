class Computadora {
    
    var cpu: String = ""
    var gpu: String = ""
    var ram: String = ""
    var alm: String = ""
}


class ComputadoraPrinter {
    static func mostrar(_ computadora: Computadora) {
        print("cpu: \(computadora.cpu)")
        print("gpu: \(computadora.gpu)")
        print("ram: \(computadora.ram)")
        print("almacenamiento: \(computadora.alm)")
    }
}


protocol ObtenerEspecificaciones {
    func obtenerCpu()
    func obtenerGpu()
    func obtenerRam()
    func obtenerAlm()
    func obtenerComponentesComputador() -> Computadora
}

class ComputadoraGamer: ObtenerEspecificaciones {
    
    var computadora = Computadora()
    
    func obtenerCpu() {
        computadora.cpu = "Intel I7"
    }
    
    func obtenerGpu() {
        computadora.gpu = "RX 580"
    }
    
    func obtenerRam() {
        computadora.ram = "16"
    }
    
    func obtenerAlm() {
        computadora.alm = "256"
    }
    
    func obtenerComponentesComputador() -> Computadora {
        return computadora
    }
    
}


class ComputadoraOficina: ObtenerEspecificaciones {
    var computadora = Computadora()
    
    func obtenerCpu() {
        computadora.cpu = "Intel I5"
    }
    
    func obtenerGpu() {
        computadora.gpu = "RX 520"
    }
    
    func obtenerRam() {
        computadora.ram = "18"
    }
    
    func obtenerAlm() {
        computadora.alm = "128"
    }
    
    func obtenerComponentesComputador() -> Computadora {
        return computadora
    }
    
}

let armarPCGamer = ComputadoraGamer()

armarPCGamer.obtenerCpu()
armarPCGamer.obtenerAlm()
armarPCGamer.obtenerRam()

var obtenerPCGamer = armarPCGamer.obtenerComponentesComputador()

ComputadoraPrinter.mostrar(obtenerPCGamer)


let armarPCOficina = ComputadoraOficina()

armarPCOficina.obtenerAlm()
armarPCOficina.obtenerCpu()

var obtenerPCOficina = armarPCOficina.obtenerComponentesComputador()

print("\n")
ComputadoraPrinter.mostrar(obtenerPCOficina)
