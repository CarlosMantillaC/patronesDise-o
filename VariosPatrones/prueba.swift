protocol Component {
    func render() -> String
}

class Button: Component {
    func render() -> String {
        return "<button> </button>"
    }
}

class InputText: Component {
    func render() -> String {
        return "<input />"
    }
}

class Select: Component {
    func render() -> String {
        return "<select> </select>"
    }
}

// Decorator
class InputTypeDecorator: Component {
    
    private var component: Component

    init(component: Component) {
        self.component = component
    }

   func render() -> String {
        let original = component.render()
        return original.replacing("<input ", with: "<input type='radio'")
    }
}

// Composite
class FormBody: Component {
    private var components: [Component] = []

    func addComponent(_ comp: Component) {
        components.append(comp)
    }

    func render() -> String {
        var formBody = ""
        for comp in components {
            formBody += comp.render()
        }
        return "<div>" + formBody + "</div>"
    }
}

class Formulario: Component {
    private var body: FormBody

    init(body: FormBody) {
        self.body = body
    }

    func render() -> String {
        return "<form>" + body.render() + "</form>"
    }
}

// Adapter
class EtiquetaTexto {
    func generarEtiqueta() -> String {
        return "<label> </label>"
    }
}

class EtiquetaTextoAdapter: Component {
    
    private var etiquetaTexto: EtiquetaTexto

    init(etiquetaTexto: EtiquetaTexto) {
        self.etiquetaTexto = etiquetaTexto
    }

    func render() -> String {
        return etiquetaTexto.generarEtiqueta()
    }
}


// Singleton
class Render {
    static var instance: Render? = nil

    private init() {}

    static func getInstance() -> Render? {
        if instance == nil {
            instance = Render()
        }
        return instance
    }

    func renderHTML(listaDeFormularios: [Component]) -> String {
        var contenidoForms = ""
        for form in listaDeFormularios {
            contenidoForms += form.render()
        }
        return "<html><body>" + contenidoForms + "</body></html>"
    }
}


let formBody1 = FormBody()
formBody1.addComponent(Button())
formBody1.addComponent(InputTypeDecorator(component: InputText()))

let formBody2 = FormBody()
formBody2.addComponent(Select())
formBody2.addComponent(EtiquetaTextoAdapter(etiquetaTexto: EtiquetaTexto()))
formBody2.addComponent(formBody1)

let form1 = Formulario(body: formBody2)

if let pagina = Render.getInstance() {
    let htmlFinal = pagina.renderHTML(listaDeFormularios: [form1])
    print(htmlFinal)
}
