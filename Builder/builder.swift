protocol ComponenteHTML {
    func mostrar() -> String
}

class Select: ComponenteHTML {
    func mostrar() -> String { "<select>Mostrar</select>" }
}

class Button: ComponenteHTML {
    func mostrar() -> String { "<button>Mostrar</button>" }
}

class Checkbox: ComponenteHTML {
    func mostrar() -> String { "<input type='checkbox' /> Mostrar" }
}

class Form {
    private var html: String = ""
    
    func agregarComponente(_ componente: ComponenteHTML) {
        html += componente.mostrar()
    }
    
    func render() -> String {
        return html
    }
}

class FormBuilder {
    private var componentes: [ComponenteHTML] = []
    
    func agregar(_ componente: ComponenteHTML) -> Self {
        componentes.append(componente)
        return self
    }
    
    func build() -> Form {
        let form = Form()
        for componente in componentes {
            form.agregarComponente(componente)
        }
        return form
    }
}

let form1 = FormBuilder()
    .agregar(Select())
    .agregar(Button())
    .agregar(Checkbox())
    .agregar(Button())
    .build()

let form2 = FormBuilder()
    .agregar(Select())
    .agregar(Select())
    .agregar(Checkbox())
    .build()

print(form1.render())
print("-------------")
print(form2.render())
