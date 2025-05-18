protocol ComponenteHTML {
    func mostrar() -> String
}

// Componentes concretos
class Select: ComponenteHTML {
    func mostrar() -> String { "<select>Mostrar</select>" }
}

class Button: ComponenteHTML {
    func mostrar() -> String { "<button>Mostrar</button>" }
}

class Checkbox: ComponenteHTML {
    func mostrar() -> String { "<input type='checkbox' /> Mostrar" }
}

class Builder {
    private var nombresComponentes: [String] = []
    
    func agregar(nombre: String) -> Self {
        nombresComponentes.append(nombre.lowercased())
        return self
    }
    
    func build() -> Form {
        var html = ""
        for nombre in nombresComponentes {
            switch nombre {
            case "select":
                html += Select().mostrar()
            case "button":
                html += Button().mostrar()
            case "checkbox":
                html += Checkbox().mostrar()
            default:
                print("⚠️ Componente no válido: '\(nombre)'")
                continue
            }
        }
        return Form(html: html)
    }
}

class Form {
    private let html: String
    
    init(html: String) {
        self.html = html
    }
    
    func render() -> String {
        return html
    }
}

// Uso con validación
let form = Builder()
    .agregar(nombre: "select")
    .agregar(nombre: "button")
    .agregar(nombre: "checkbox")
    .build()

    let form2 = Builder()
    .agregar(nombre: "select")
    .agregar(nombre: "button")
    .agregar(nombre: "checkbox")
    .build()


print(form.render())
print(form2.render())