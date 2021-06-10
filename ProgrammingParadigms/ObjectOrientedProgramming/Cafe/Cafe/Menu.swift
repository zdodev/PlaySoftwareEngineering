struct Menu {
    private let items: [MenuItem]
    
    init(items: [MenuItem]) {
        self.items = items
    }
    
    func choose(name: String) -> MenuItem? {
        for item in items {
            if item.name == name {
                return item
            }
        }
        
        return nil
    }
}
