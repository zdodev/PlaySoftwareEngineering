struct Dollar {
    var amount = 0
    
    init(_ amount: Int) {
        self.amount = amount
    }
    
    func times(_ multiplier: Int) -> Dollar {
        Dollar(amount * multiplier)
    }
}

extension Dollar: Equatable {}
