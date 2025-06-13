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
    
    return primo(n: n, divisor: divisor+1)
}

print(primo(n: 61))
