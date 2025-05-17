final class Singleton {
    
    static let shared = Singleton()
    
    private init() {
        print("Singleton inicializado")
    }
}

func testSingleton() {

    let instance1 = Singleton.shared
    let instance2 = Singleton.shared
    
    if instance1 === instance2 {
        print("✓ Las dos variables contienen la misma instancia")
        print("Dirección memoria instance1: \(Unmanaged.passUnretained(instance1).toOpaque())")
        print("Dirección memoria instance2: \(Unmanaged.passUnretained(instance2).toOpaque())")
    } else {
        print("✗ Las variables contienen diferentes instancias")
    }
    
}
testSingleton()