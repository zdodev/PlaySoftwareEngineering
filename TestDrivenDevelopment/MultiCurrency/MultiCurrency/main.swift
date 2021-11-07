class Money {
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
}

extension Money: Equatable {
    static func == (lhs: Money, rhs: Money) -> Bool {
        lhs.amount == rhs.amount && lhs.currencyName == rhs.currencyName
    }
}
