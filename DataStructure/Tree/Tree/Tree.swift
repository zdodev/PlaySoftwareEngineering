class BinaryTreeNode<T: Comparable> {
    var value: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    weak var parent: BinaryTreeNode?
    
    init(value: T, leftChild: BinaryTreeNode? = nil, rightChild: BinaryTreeNode? = nil, parent: BinaryTreeNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
    }
    
    func insertNodeFromRoot(value: T) {
        if let _ = parent {
            print("not root node.")
            return
        }
        
        addNode(value: value)
    }
    
    private func addNode(value: T) {
        if value < self.value {
            if let leftChild = leftChild {
                leftChild.addNode(value: value)
            } else {
                let newNode = BinaryTreeNode(value: value)
                newNode.parent = self
                leftChild = newNode
            }
        } else {
            if let rightChild = rightChild {
                rightChild.addNode(value: value)
            } else {
                let newNode = BinaryTreeNode(value: value)
                newNode.parent = self
                rightChild = newNode
            }
        }
    }
    
    func traverseInOrder(node: BinaryTreeNode?) {
        guard let node = node else {
            return
        }
        
        traverseInOrder(node: node.leftChild)
        print(node.value)
        traverseInOrder(node: node.rightChild)
    }
    
    func traversePreOrder(node: BinaryTreeNode?) {
        guard let node = node else {
            return
        }
        
        print(node.value)
        traversePreOrder(node: node.leftChild)
        traversePreOrder(node: node.rightChild)
    }
    
    func traversePostOrder(node: BinaryTreeNode?) {
        guard let node = node else {
            return
        }
        
        traversePostOrder(node: node.leftChild)
        traversePostOrder(node: node.rightChild)
        print(node.value)
    }
    
    func search(value: T) -> BinaryTreeNode? {
        if self.value == value {
            return self
        }
        
        if self.value > value {
            guard let left = leftChild else {
                return nil
            }
            return left.search(value: value)
        } else {
            guard let right = rightChild else {
                return nil
            }
            return right.search(value: value)
        }
    }
    
    func delete() {
        if let left = leftChild {
            if let _ = rightChild {
                exchangeWithSuccessor()
            } else {
                connectParentTo(child: left)
            }
        } else if let right = rightChild {
            connectParentTo(child: right)
        } else {
            connectParentTo(child: nil)
        }
        
        parent = nil
        leftChild = nil
        rightChild = nil
    }
    
    private func exchangeWithSuccessor() {
        guard let right = rightChild, let left = leftChild else {
            return
        }
        
        let successor = right.minimum()
        successor.delete()
        
        successor.leftChild = left
        left.parent = successor
        
        if right !== successor {
            successor.rightChild = right
            right.parent = successor
        } else {
            successor.rightChild = nil
        }
        
        connectParentTo(child: successor)
    }
    
    private func connectParentTo(child: BinaryTreeNode?) {
        guard let parent = parent else {
            child?.parent = parent
            return
        }
        
        if parent.leftChild === self {
            parent.leftChild = child
            child?.parent = parent
        } else if parent.rightChild === self {
            parent.rightChild = child
            child?.parent = parent
        }
    }
    
    private func minimumValue() -> T {
        if let left = leftChild {
            return left.minimumValue()
        } else {
            return value
        }
    }
    
    private func maximumValue() -> T {
        if let right = rightChild {
            return right.maximumValue()
        } else {
            return value
        }
    }
    
    private func minimum() -> BinaryTreeNode {
        if let left = leftChild {
            return left.minimum()
        } else {
            return self
        }
    }
    
    private func maximum() -> BinaryTreeNode {
        if let right = rightChild {
            return right.maximum()
        } else {
            return self
        }
    }
    
    private func height() -> Int {
        if leftChild == nil && rightChild == nil {
            return 0
        }
        
        return 1 + max(leftChild?.height() ?? 0, rightChild?.height() ?? 0)
    }
    
    private func depth() -> Int {
        guard var node = parent else {
            return 0
        }
        var depth = 1
        
        while let parent = node.parent {
            depth = depth + 1
            node = parent
        }
        
        return depth
    }
}
