// 배열로 구현된 스택
struct Stack<T> {
    private var elements = [T]()
    // push 연산
    init() {}
    mutating func push(_ element: T) {
        elements.append(element)
    }
    // pop 연산
    mutating func pop() -> T? {
        elements.popLast()
    }
    // peek 연산
    func peek() -> T? {
        elements.last
    }
    // count 연산
    func count() -> Int {
        elements.count
    }
    // isEmpty 연산
    func isEmpty() -> Bool {
        elements.isEmpty
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        elements.description
    }
}

extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
        elements.debugDescription
    }
}

// IteratorProtocol이란?
struct ArrayIterator<T>: IteratorProtocol {
    var currentElement: [T]
    init(elements: [T]) {
        self.currentElement = elements
    }
    mutating func next() -> T? {
        currentElement.popLast()
    }
}

// Sequence란?
extension Stack: Sequence {
    func makeIterator() -> some IteratorProtocol {
        // 1.
        // ArrayIterator<T>(elements: elements)
        // 2.
        AnyIterator(IndexingIterator(_elements: elements.lazy))
    }
    init<S: Sequence>(_ seq: S) where S.Iterator.Element == T {
        elements = Array(seq)
    }
}
