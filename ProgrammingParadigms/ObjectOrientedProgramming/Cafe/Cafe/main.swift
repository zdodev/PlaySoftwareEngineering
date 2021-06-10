let customer = Customer()
let menuItems: [MenuItem] = [MenuItem(name: "아메리카노", price: 1000)]
let menu = Menu(items: menuItems)
let barista = Barista()
customer.order(menuName: "아메리카노", menu: menu, barista: barista)
customer.order(menuName: "카페라떼", menu: menu, barista: barista)
