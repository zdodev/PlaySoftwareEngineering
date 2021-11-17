protocol Expression {
    func reduce(_ bank: Bank, _ to: String) -> Money
    func plus(_ addend: Expression) -> Expression
    func times(_ multiplier: Int) -> Expression
}

struct Money {
    fileprivate var amount = 0
    fileprivate var currencyName = ""
    
    init(_ amount: Int, _ currency: String) {
        self.amount = amount
        self.currencyName = currency
    }
    
    func times(_ multiplier: Int) -> Expression {
        Money(amount * multiplier, currencyName)
    }
    
    static func dollar(_ amount: Int) -> Money {
        Money(amount, "USD")
    }
    
    static func franc(_ amount: Int) -> Money {
        Money(amount, "CHF")
    }
    
    func currency() -> String {
        currencyName
    }
    
    func plus(_ addend: Expression) -> Expression {
        Sum(self, addend)
    }
    
    func reduce(_ bank: Bank, _ to: String) -> Money {
        let rate = bank.rate(currencyName, to)
        return Money(amount / rate, to)
    }
}

extension Money: Equatable {
    static func == (lhs: Money, rhs: Money) -> Bool {
        lhs.amount == rhs.amount && lhs.currencyName == rhs.currencyName
    }
}

extension Money: Expression {
    
}

struct Bank {
    private struct Pair: Equatable, Hashable {
        private let from: String
        private let to: String
        
        init(_ from: String, _ to: String) {
            self.from = from
            self.to = to
        }
    }
    
    private var rates = [Pair: Int]()
    
    func reduce(_ source: Expression, _ to: String) -> Money {
        return source.reduce(self, to)
    }
    
    mutating func addRate(_ from: String, _ to: String, _ rate: Int) {
        let pair = Pair(from, to)
        rates[pair] = rate
    }
    
    func rate(_ from: String, _ to: String) -> Int {
        if from == to {
            return 1
        }
        
        let pair = Pair(from, to)
        let rate = rates[pair]!
        return rate
    }
}

struct Sum {
    let augend: Expression
    let addend: Expression
    
    init(_ augend: Expression, _ addend: Expression) {
        self.augend = augend
        self.addend = addend
    }
    
    func reduce(_ bank: Bank, _ to: String) -> Money {
        let amount = augend.reduce(bank, to).amount + addend.reduce(bank, to).amount
        return Money(amount, to)
    }
    
    func times(_ multiplier: Int) -> Expression {
        Sum(augend.times(multiplier), addend.times(multiplier))
    }
}

extension Sum: Expression {
    func plus(_ addend: Expression) -> Expression {
        Sum(self, addend)
    }
}
