let rootNode = BinaryTreeNode(value: 10)
rootNode.insertNodeFromRoot(value: 20)
rootNode.insertNodeFromRoot(value: 5)
rootNode.insertNodeFromRoot(value: 21)
rootNode.insertNodeFromRoot(value: 8)
rootNode.insertNodeFromRoot(value: 4)

//rootNode.traverseInOrder(node: rootNode)
//rootNode.traversePreOrder(node: rootNode)
//rootNode.traversePostOrder(node: rootNode)

//print("Search result: \(rootNode.search(value: 1)?.value)")
//print("Search result: \(rootNode.search(value: 4)?.value)")

rootNode.leftChild?.delete()
rootNode.traverseInOrder(node: rootNode)
rootNode.rightChild?.delete()
rootNode.traverseInOrder(node: rootNode)
