struct Coffee {
    private let name: String
    private let price: Int
    
    init(menuItem: MenuItem) {
        self.name = menuItem.name
        self.price = menuItem.price
    }
}
