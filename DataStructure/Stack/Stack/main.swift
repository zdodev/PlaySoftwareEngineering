// MARK: - Stack 테스트
var myStack = Stack<Int>()
myStack.push(3)
myStack.push(5)
myStack.push(7)

print(myStack.pop()!)
print(myStack.pop()!)
print(myStack.pop()!)

// MARK: - 배열 리터럴 문법 사용
var array = [4, 5, 6, 7]
var myStackFromStack = Stack<Int>(array)
myStackFromStack.push(9)
myStackFromStack.push(11)
print(myStackFromStack)
