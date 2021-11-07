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
        Dollar(amount, "USD")
    }
    
    static func franc(_ amount: Int) -> Money {
        Franc(amount, "CHF")
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

final class Dollar: Money {
    override init(_ amount: Int, _ currency: String) {
        super.init(amount, currency)
    }
}

final class Franc: Money {
    override init(_ amount: Int, _ currency: String) {
        super.init(amount, currency)
    }
}
