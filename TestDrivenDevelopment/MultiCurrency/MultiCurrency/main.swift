struct Dollar {
    private var amount = 0
    
    init(_ amount: Int) {
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Dollar {
        Dollar(amount * multiplier)
    }
}

extension Dollar: Equatable {}

struct Franc {
    private var amount = 0
    
    init(_ amount: Int) {
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Franc {
        Franc(amount * multiplier)
    }
}

extension Franc: Equatable {}
