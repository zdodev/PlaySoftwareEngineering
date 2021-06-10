struct Barista {
    func makeCoffee(menuItem: MenuItem) -> Coffee {
        let coffee = Coffee(menuItem: menuItem)
        return coffee
    }
}
