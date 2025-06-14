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
print(fibonacci(n: 5))

/*

fibo(4, 1, 1) + 1

fibo(3, 1, 2) + 1

fibo(2, 2, 3) + 2

fibo(1, 3, 5) + 3

5





*/