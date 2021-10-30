struct Dollar {
    var amount = 0
    
    init(_ amount: Int) {
        self.amount = amount
    }
    
    mutating func times(_ multiplier: Int) -> Dollar {
        Dollar(amount * multiplier)
    }
}
