
// MARK: - Subsistema de Vuelos (solo con id y nombre)
class SistemaVuelos {
    func obtenerVuelosDisponibles() -> [Vuelo] {
        return [
            Vuelo(id: "V001", nombre: "Vuelo AeroMex"),
            Vuelo(id: "V002", nombre: "Vuelo Volaris"),
            Vuelo(id: "V003", nombre: "Vuelo Interjet")
        ]
    }
}

struct Vuelo {
    let id: String
    let nombre: String
}

// MARK: - Subsistema de Hoteles (solo con id y nombre)
class SistemaHoteles {
    func obtenerHotelesDisponibles() -> [Hotel] {
        return [
            Hotel(id: "H001", nombre: "Hotel Plaza"),
            Hotel(id: "H002", nombre: "Suites Paradiso"),
            Hotel(id: "H003", nombre: "Costa Azul")
        ]
    }
}

struct Hotel {
    let id: String
    let nombre: String
}

// MARK: - Fachada Simplificada
class BuscadorViajesFacade {
    private let sistemaVuelos = SistemaVuelos()
    private let sistemaHoteles = SistemaHoteles()
    
    func buscarOpciones() -> (vuelos: [Vuelo], hoteles: [Hotel]) {
        let vuelos = sistemaVuelos.obtenerVuelosDisponibles()
        let hoteles = sistemaHoteles.obtenerHotelesDisponibles()
        return (vuelos, hoteles)
    }
}

// MARK: - Ejemplo de uso
let buscador = BuscadorViajesFacade()
let resultados = buscador.buscarOpciones()

print(resultados)