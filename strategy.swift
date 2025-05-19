protocol Strategy {
    func execute()
}

class ConcreteStrategyA: Strategy {
    func execute() {
        print("Ejecutando estrategia A")
    }
}

class ConcreteStrategyB: Strategy {
    func execute() {
        print("Ejecutando estrategia B")
    }
}

class Context {
    private var strategy: Strategy?
    
    func setStrategy(_ strategy: Strategy) {
        self.strategy = strategy
    }
    
    func executeStrategy() {
        guard let strategy = strategy else {
            print("No se ha establecido una estrategia")
            return
        }
        strategy.execute()
    }
}

let context = Context()

let strategyA = ConcreteStrategyA()
let strategyB = ConcreteStrategyB()

context.setStrategy(strategyA)
context.executeStrategy()

context.setStrategy(strategyB)
context.executeStrategy()