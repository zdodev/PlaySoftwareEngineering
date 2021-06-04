struct VendingMachine {
    private var changeAmount = 0
    
    mutating func putCoin(_ coin: Int) {
        changeAmount += coin
    }
    
    func getChangeAmount() -> Int {
        changeAmount
    }
    
    func selectDrink(Drink drink) {
        changeAmount -= drink.getPrice()
    }
    
    func getChangeCoinSet() -> CoinSet {
        
    }
}
