protocol Silla {
    func sentarse()
    func describir()
}

protocol Sofa {
    func recostarse()
    func describir()
}

protocol FabricaMuebles {
    func crearSilla() -> Silla
    func crearSofa() -> Sofa
}

class SillaModerna: Silla {
    func sentarse() {
        print("Sentándose en una silla moderna")
    }
    
    func describir() {
        print("Silla moderna")
    }
}

class SofaModerno: Sofa {
    func recostarse() {
        print("Recostándose en un sofá moderno")
    }
    
    func describir() {
        print("Sofá moderno")
    }
}

class SillaVictoriana: Silla {
    func sentarse() {
        print("Sentándose en una silla victoriana")
    }
    
    func describir() {
        print("Silla victoriana")
    }
}

class SofaVictoriano: Sofa {
    func recostarse() {
        print("Recostándose en un sofá victoriano")
    }
    
    func describir() {
        print("Sofá victoriano")
    }
}

class FabricaModerna: FabricaMuebles {
    func crearSilla() -> Silla {
        return SillaModerna()
    }
    
    func crearSofa() -> Sofa {
        return SofaModerno()
    }
}

class FabricaVictoriana: FabricaMuebles {
    func crearSilla() -> Silla {
        return SillaVictoriana()
    }
    
    func crearSofa() -> Sofa {
        return SofaVictoriano()
    }
}

class ClienteMuebles {
    private let fabrica: FabricaMuebles
    
    init(fabrica: FabricaMuebles) {
        self.fabrica = fabrica
    }
    
    func crearConjuntoMuebles() {
        let silla = fabrica.crearSilla()
        let sofa = fabrica.crearSofa()
        
        silla.describir()
        sofa.describir()
        
        silla.sentarse()
        sofa.recostarse()
    }
}

func main() {

    let fabricaModerna = FabricaModerna()
    let fabricaVictoriana = FabricaVictoriana()
    
    print("--- Creando muebles modernos ---")
    let clienteModerno = ClienteMuebles(fabrica: fabricaModerna)
    clienteModerno.crearConjuntoMuebles()
    
    print("\n--- Creando muebles victorianos ---")
    let clienteVictoriano = ClienteMuebles(fabrica: fabricaVictoriana)
    clienteVictoriano.crearConjuntoMuebles()
}

main()