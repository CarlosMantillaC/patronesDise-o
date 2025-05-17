var contadorContextos = 0

func fibonacci(n: Int, a: Int = 0, b: Int = 1) -> Int {
    contadorContextos += 1

    if n < 0 {
        fatalError("El número debe ser no negativo")
    }
    if n == 0 {
        return a
    }
    if n == 1 {
        return b
    }

    return fibonacci(n: n - 1, a: b, b: a + b) + b
}

let resultado = fibonacci(n: 10)
print("Resultado: \(resultado)")
print("Total contextos usados: \(contadorContextos)\n")



func palindromoSubstring(_ s: String) -> Bool {
    if s.count <= 1 {
        return true
    }
    
    let start = s.startIndex
    let end = s.index(before: s.endIndex)
    
    if s[start] != s[end] {
        return false
    }
    
    let innerRange = s.index(after: start)..<end
    let innerSubstring = String(s[innerRange])
    
    print("Substring reducido en contexto: '\(innerSubstring)'")
    
    return palindromoSubstring(innerSubstring)
}

let resultado2 = palindromoSubstring("oro")
print("Resultado: \(resultado2)\n")



func primo(n: Int, divisor: Int = 2) -> Bool {
    if n < 2 {
        return false
    }
    if divisor * divisor > n {
        return true
    }
    if n % divisor == 0 {
        return false
    }
    return primo(n: n, divisor: divisor + 1)
}

let resultado3 = primo(n: 4)
print("Resultado: \(resultado3)")