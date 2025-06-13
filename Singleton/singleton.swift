class GestorConfiguracion {
    
    private static var instancia: GestorConfiguracion?
    
    private init() {
        print("Configuracion cargada")
    }
    
    static func obtenerInstancia() -> GestorConfiguracion? {
        if instancia == nil {
            instancia = GestorConfiguracion()
        }
        return instancia
    }

}


let config1 = GestorConfiguracion.obtenerInstancia()

let config2 = GestorConfiguracion.obtenerInstancia()

print(config1 === config2)

