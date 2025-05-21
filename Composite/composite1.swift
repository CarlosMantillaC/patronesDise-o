protocol ComponenteHTML {
    func mostrar() -> String
}

class Html: ComponenteHTML {
    private var body: ComponenteHTML
    
    init(body: ComponenteHTML) {
        self.body = body
    }
    
    func mostrar() -> String {
        return "<html>\n\(body.mostrar())\n</html>"
    }
}

class Body: ComponenteHTML {
    private var children: [ComponenteHTML] = []
    
    func agregar(componente: ComponenteHTML) {
        children.append(componente)
    }
    
    func mostrar() -> String {
        let childrenContent = children.map { $0.mostrar() }.joined(separator: "\n")
        return "<body>\n\(childrenContent)\n</body>"
    }
}

class Select: ComponenteHTML {
    func mostrar() -> String { "  <select>Mostrar</select>" }
}

class Button: ComponenteHTML {
    func mostrar() -> String { "  <button>Mostrar</button>" }
}

class Checkbox: ComponenteHTML {
    func mostrar() -> String { "  <input type='checkbox' /> Mostrar" }
}

// Composite genérico para otros grupos
class FormComposite: ComponenteHTML {
    private var componentes: [ComponenteHTML] = []
    
    func agregar(componente: ComponenteHTML) {
        componentes.append(componente)
    }
    
    func mostrar() -> String {
        return componentes.map { $0.mostrar() }.joined(separator: "\n")
    }
}

let body = Body()
let form = FormComposite()

form.agregar(componente: Select())
form.agregar(componente: Button())
form.agregar(componente: Checkbox())

body.agregar(componente: form)
let html = Html(body: body)

print(html.mostrar())