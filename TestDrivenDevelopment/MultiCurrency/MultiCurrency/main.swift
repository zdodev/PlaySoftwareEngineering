protocol Expression {
    func reduce(_ to: String) -> Money
}

struct Money {
    fileprivate var amount = 0
    fileprivate var currencyName = ""
    
    init(_ amount: Int, _ currency: String) {
        self.amount = amount
        self.currencyName = currency
    }
    
    func times(_ multiplier: Int) -> Money {
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
    
    func plus(_ addend: Money) -> Expression {
        Sum(self, addend)
    }
    
    func reduce(_ to: String) -> Money {
        self
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
    func reduce(_ source: Expression, _ to: String) -> Money {
        return source.reduce(to)
    }
}

struct Sum {
    let augend: Money
    let addend: Money
    
    init(_ augend: Money, _ addend: Money) {
        self.augend = augend
        self.addend = addend
    }
    
    func reduce(_ to: String) -> Money {
        let amount = augend.amount + addend.amount
        return Money(amount, to)
    }
}

extension Sum: Expression {
    
}
