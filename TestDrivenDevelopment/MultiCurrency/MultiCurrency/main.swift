class Money {
    fileprivate var amount = 0
    
    func times(_ multiplier: Int) -> Money {
        Money()
    }
    
    static func dollar(_ amount: Int) -> Money {
        Dollar(amount)
    }
    
    static func franc(_ amount: Int) -> Money {
        Franc(amount)
    }
}

extension Money: Equatable {
    static func == (lhs: Money, rhs: Money) -> Bool {
        lhs.amount == rhs.amount && type(of: lhs) == type(of: rhs)
    }
}

final class Dollar: Money {
    init(_ amount: Int) {
        super.init()
        self.amount = amount
    }
    
    override func times(_ multiplier: Int) -> Money {
        Dollar(amount * multiplier)
    }
}

final class Franc: Money {
    init(_ amount: Int) {
        super.init()
        self.amount = amount
    }
    
    override func times(_ multiplier: Int) -> Money {
        Franc(amount * multiplier)
    }
}
