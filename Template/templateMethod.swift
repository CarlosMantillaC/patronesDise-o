protocol PrepararBebida {
    func templateMethod()
    func hervirAgua()
    func agregarIngrediente()
    func servirEnTaza()
}

extension PrepararBebida {
    
    func templateMethod() {
        hervirAgua()
        agregarIngrediente()
        servirEnTaza()
    }
    
    func hervirAgua() {
        print("hirviendo agua")
    }
    
    func servirEnTaza() {
        print("sirviendo en taza")
    }
}


class Cafe: PrepararBebida {
    
    func agregarIngrediente() {
        print("agregando café")
    }
    
}

class Te: PrepararBebida {
    
    func agregarIngrediente() {
        print("agregando té")
    }
}

let cafe = Cafe()
cafe.templateMethod()
