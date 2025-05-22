from abc import ABC, abstractmethod

class Component(ABC):
    @abstractmethod
    def render(self):
        pass

class Button(Component):
    def render(self):
        return "<button> </button>"

class InputText(Component):
    def render(self):
        return "<input />"

class Select(Component):
    def render(self):
        return "<select> </select>"

# ==============================
# PATRÓN DECORATOR
# ==============================

class TypeDecorator(Component):
    def __init__(self, component):
        self.component = component

    def render(self):
        return self.component.render()
    
class InputTypeDecorator(TypeDecorator):
    def __init__(self, component):
        super().__init__(component)

    def render(self):
        html = self.component.render()
        html = html.replace("<input", f'<input type="radio"')
        return html
    

# ==============================
# PATRÓN COMPOSITE
# ==============================

class SalidaBuilder(ABC):
    @abstractmethod
    def get_components(self):
        pass
    
class Formulario(SalidaBuilder):
    def __init__(self):
        self.components = []

    def add_component(self, comp):
        self.components.append(comp)

    def get_components(self):
        return self.components


# ==============================
# PATRÓN ADAPTER
# ==============================

class SalidaAdapter:
    def __init__(self, form: SalidaBuilder):
        self.form = form

    def getEntradaFormada(self):
        html = ""
        for comp in self.form.get_components():
            html += comp.render()
        return html


# ==============================
# PATRÓN SINGLETON
# ==============================

class Render:
    _instance = None

    def __init__(self):
        if Render._instance is not None:
            raise Exception("Esta clase es Singleton. Usa getInstance()")
        Render._instance = self

    @staticmethod
    def getInstance():
        if Render._instance is None:
            Render()
        return Render._instance

    def render_html(self, contenido):
        return f"<html><body><form>{contenido}</form></body></html>"


# ==============================
# APLICACIÓN PRINCIPAL
# ==============================

class Application:
    @staticmethod
    def main():
        # Crear componentes
        boton = Button()

        input = InputText()
        select = Select()
        radio = InputTypeDecorator(input)

        # Crear formulario y agregar componentes
        formulario = Formulario()
        formulario.add_component(input)
        formulario.add_component(select)
        formulario.add_component(boton)
        formulario.add_component(radio)

        # Adaptar para salida HTML
        adaptador = SalidaAdapter(formulario)
        salida_html = adaptador.getEntradaFormada()

        # Renderizar
        render = Render.getInstance()
        html_completo = render.render_html(salida_html)

        return html_completo


# Ejecutar
print(Application.main())