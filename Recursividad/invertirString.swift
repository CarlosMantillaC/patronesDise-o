func invertir(palabra: String) -> String {
    
    if palabra.isEmpty {
        return ""
    }
    
    let primera = palabra.first!
    let resto = String(palabra.dropFirst())

    
    return invertir(palabra: resto) + String(primera)
}

print(invertir(palabra: "hola"))


/*
 
 invertir(ola) + h
 
 invertir(la) + o
 
 invertir(a) + l
 
 invertir() + a
 
 ""
 
 "" + a = a
 a + l = al
 al + o = alo
 alo + h = aloh
 
 ---------------------------
 h + invertir(ola)
 
 o + invertir(la)
 
 l + invertir(a)
 
 a + invertir()
 
 ""
 
 a + "" = a
 l + a = la
 o + la = ola
 h + ola = hola
 
 */
