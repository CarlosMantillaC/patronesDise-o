protocol ComponenteHTML {
    func construir() -> String
    func mostrar() -> String
}

class Select: ComponenteHTML {
    func construir() -> String { "<select></select>" }
    func mostrar() -> String { "<select>Mostrar</select>" }
}

class Button: ComponenteHTML {
    func construir() -> String { "<button></button>" }
    func mostrar() -> String { "<button>Mostrar</button>" }
}

class Checkbox: ComponenteHTML {
    func construir() -> String { "<input type='checkbox' />" }
    func mostrar() -> String { "<input type='checkbox' /> Mostrar" }
}

class Builder {
    private var nombresComponentes: [String] = []

    func agregar(nombre: String) {
        nombresComponentes.append(nombre)
    }

    func obtenerNombres() -> [String] {
        return nombresComponentes
    }
}

class Formulario {
    private let builder: Builder

    init(builder: Builder) {
        self.builder = builder
    }


    func mostrarForm() -> String {
        var html = ""
        let nombres = builder.obtenerNombres()

        for nombre in nombres {
            var componente: ComponenteHTML?

            switch nombre.lowercased() {
                case "select":
                    componente = Select()
                case "button":
                    componente = Button()
                case "checkbox":
                    componente = Checkbox()
                default:
                    print("Ingrediente desconocido: \(nombre)")
            }

            if let comp = componente {
                html += comp.mostrar()
            }
        }

        return html
    }
}

let builder = Builder()
builder.agregar(nombre: "select")
builder.agregar(nombre: "button")
builder.agregar(nombre: "checkbox")

let formulario = Formulario(builder: builder)

print(formulario.mostrarForm())
