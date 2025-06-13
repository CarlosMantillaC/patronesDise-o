func fibonacci(n: Int, a: Int = 0, b: Int = 1) -> Int {
    
    if n < 0 {
        fatalError("error")
    }
    
    if n == 0 {
        return a
    }
    
    if n == 1 {
        return b
    }
    
    return fibonacci(n: n-1, a: b, b: a+b) + b
}