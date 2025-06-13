func palindromo(_ palabra: String) -> Bool {
    
    if palabra.count <= 1 {
        return true
    }
    
    let start = palabra.startIndex
    let end = palabra.index(before: palabra.endIndex)
    
    if palabra[start] != palabra[end] {
        return false
    }
    
    let innerRange = palabra.index(after: start)..<end
    let innerSubstring = String(palabra[innerRange])
    
    return palindromo(innerSubstring)
    
}

print(palindromo("oro"))
