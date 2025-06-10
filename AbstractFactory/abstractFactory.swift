protocol Button {
    
    func render()
}

class WindowsButton: Button {
    
    func render() {
        print("renderizando boton Windows")
    }
}

class MacButton: Button {
    
    func render() {
        print("renderizando boton Mac")
    }
}

protocol Window {
    
    func open()
}

class WindowsWindow: Window {
    
    func open() {
        print("abriendo ventana de Windows")
    }
}

class MacWindow: Window {
    
    func open() {
        print("abriendo ventana de Mac")
    }
}

protocol GUIFactory {
    
    func createButton() -> Button
    func createWindow() -> Window
}


class WindowsFactory: GUIFactory {
    
    func createButton() -> any Button {
        return WindowsButton()
    }
    
    func createWindow() -> any Window {
        return WindowsWindow()
    }
}

class MacFactory: GUIFactory {

    func createButton() -> any Button {
        return MacButton()
    }
    
    func createWindow() -> any Window {
        return MacWindow()
    }
}


let factory: GUIFactory = MacFactory()

let button = factory.createButton()
let window = factory.createWindow()
button.render()
window.open()
