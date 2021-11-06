class Money {
    fileprivate var amount = 0
    fileprivate var currencyName = ""
    
    init(_ amount: Int, _ currency: String) {
        self.amount = amount
        self.currencyName = currency
    }
    
    func times(_ multiplier: Int) -> Money {
        Money(0, "")
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
        lhs.amount == rhs.amount && type(of: lhs) == type(of: rhs)
    }
}

final class Dollar: Money {
    override init(_ amount: Int, _ currency: String) {
        super.init(amount, currency)
    }
    
    override func times(_ multiplier: Int) -> Money {
        Money.dollar(amount * multiplier)
    }
}

final class Franc: Money {
    override init(_ amount: Int, _ currency: String) {
        super.init(amount, currency)
    }
    
    override func times(_ multiplier: Int) -> Money {
        Money.franc(amount * multiplier)
    }
}
