struct Queue<T> {
    private var data = [T]()
    
    mutating func enqueue(_ value: T) {
        data.append(value)
    }
    
    mutating func dequeue() -> T? {
        data.first != nil ? data.removeFirst() : nil
    }
}
