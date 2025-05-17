func recursiva() {
    var arreglo = [Int](repeating: 0, count: 10000)  // usa bastante stack
    print("Llamando...")
    recursiva()
}

recursiva()
