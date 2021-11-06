class Money {
    fileprivate var amount = 0
}

extension Money: Equatable {
    static func == (lhs: Money, rhs: Money) -> Bool {
        lhs.amount == rhs.amount
    }
}

final class Dollar: Money {
    init(_ amount: Int) {
        super.init()
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Dollar {
        Dollar(amount * multiplier)
    }
}

final class Franc: Money {
    init(_ amount: Int) {
        super.init()
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Franc {
        Franc(amount * multiplier)
    }
}
