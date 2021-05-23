struct Account {
    private(set) var balance: Int
    
    init(_ balance: Int) {
        self.balance = balance
    }
    
    mutating func deposit(_ money: Int) {
        balance += money
    }
    
    mutating func withdraw(_ money: Int) {
        balance -= money
    }
}
