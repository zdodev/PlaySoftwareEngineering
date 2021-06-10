struct Customer {
    func order(menuName: String, menu: Menu, barista: Barista) {
        guard let menuItem = menu.choose(name: menuName) else {
            print("\(menuName) 메뉴가 존재하지 않습니다.")
            return
        }
        
        let coffee = barista.makeCoffee(menuItem: menuItem)
        print(coffee)
    }
}
