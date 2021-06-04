struct LinkedList<T: Equatable> {
    class Node<T> {
        let data: T
        fileprivate var next: Node?
        
        init(_ data: T) {
            self.data = data
        }
    }
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    mutating func append(value: T) {
        let newNode = Node(value)
        
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    func remove(value: T) {
        var currentNode = head

        while currentNode?.next != nil {
            if let data = currentNode?.next?.data, data == value {
                currentNode?.next = currentNode?.next?.next
            } else {
                currentNode = currentNode?.next
            }
        }
    }
    
    
    func isEmpty() -> Bool {
        head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var text = "["
        var currentNode = head
        
        while currentNode != nil {
            text += "\(currentNode!.data)"
            currentNode = currentNode!.next
            if currentNode != nil {
                text += ", "
            }
        }
        
        return text + "]"
    }
}
