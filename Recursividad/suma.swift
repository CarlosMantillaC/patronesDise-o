func sumaRecursiva(n: Int) -> Int {
    
    if n <= 0 {
        return 0
    }

    return n + sumaRecursiva(n: n-1)
}

print(sumaRecursiva(n: 5))


/*

 sumaRecursiva(4)
 → 4 + sumaRecursiva(3)
 → 4 + (3 + sumaRecursiva(2))
 → 4 + (3 + (2 + sumaRecursiva(1)))
 → 4 + (3 + (2 + (1 + sumaRecursiva(0))))
 → 4 + (3 + (2 + (1 + 0)))     ← condición base aquí
 → 4 + (3 + (2 + 1))
 → 4 + (3 + 3)
 → 4 + 6
 → 10
 
 */
