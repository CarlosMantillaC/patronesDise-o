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
        html = html.replace("<input", '<input type="radio"')
        return html

# ==============================
# PATRÓN COMPOSITE
# ==============================
class Formulario(Component):  # Composite
    def __init__(self):
        self.components = []

    def add_component(self, comp):
        self.components.append(comp)

    def render(self):
        html = ""
        for comp in self.components:
            html += comp.render()
        return f"<div>{html}</div>"

# ==============================
# PATRÓN ADAPTER
# ==============================
class SalidaAdapter:
    def __init__(self, obj):
        # Convertir a Component si es necesario
        if isinstance(obj, Component):
            self.obj = obj
        elif isinstance(obj, EtiquetaTexto):
            self.obj = EtiquetaTextoAdapter(obj)
        else:
            self.obj = None

    def getEntradaFormada(self):
        if self.obj:
            return self.obj.render()
        else:
            return "<!-- componente no compatible -->"

# Componente externo no compatible originalmente
class EtiquetaTexto:
    def generar_etiqueta(self):
        return f"<label> </label>"

# Adaptador para EtiquetaTexto
class EtiquetaTextoAdapter(Component):
    def __init__(self, etiqueta_texto):
        self.etiqueta_texto = etiqueta_texto

    def render(self):
        return self.etiqueta_texto.generar_etiqueta()

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

        # Componente externo + adaptador
        etiqueta_externa = EtiquetaTexto()
        adaptador_etiqueta = EtiquetaTextoAdapter(etiqueta_externa)
        # Crear formulario principal
        formulario_principal = Formulario()

        # Crear formulario anidado
        formulario_anidado = Formulario()
        formulario_anidado.add_component(Button())
        formulario_anidado.add_component(InputText())
        formulario_anidado.add_component(adaptador_etiqueta)

        # Agregar formulario anidado dentro del principal
        formulario_principal.add_component(formulario_anidado)

        # Agregar componentes simples al formulario principal
        formulario_principal.add_component(Select())
        formulario_principal.add_component(InputText())

        # Usar el adaptador y render singleton como antes
        adaptador = SalidaAdapter(formulario_principal)
        salida_html = adaptador.getEntradaFormada()

        render = Render.getInstance()
        html_completo = render.render_html(salida_html)
        return html_completo

# Ejecutar aplicación
print(Application.main())
