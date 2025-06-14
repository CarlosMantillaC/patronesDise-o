func sumaRecursiva(n: Int) -> Int {
    
    if n <= 0 {
        return 0
    }

    return n + sumaRecursiva(n: n-1)
}

print(sumaRecursiva(n: 5))


/*

5 + sumaRecursiva(n: 4)
4 + sumaRecursiva(n: 3)
3 + sumaRecursiva(n: 2)
2 + sumaRecursiva(n: 1)
1 + sumaRecursiva(n: 0)
0

1 + 0 = 1

2 + 1 = 3

3 + 3 = 6

4 + 6 = 10

5 + 10 = 15

 */
