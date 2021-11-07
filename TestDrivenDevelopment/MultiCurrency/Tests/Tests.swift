import XCTest

class Tests: XCTestCase {
    func test_multiplication() {
        let five = Money.dollar(5)
        XCTAssertEqual(Money.dollar(10), five.times(2))
        XCTAssertEqual(Money.dollar(15), five.times(3))
    }
    
    func test_equality() {
        XCTAssertEqual(Money.dollar(5), Money.dollar(5))
        XCTAssertNotEqual(Money.dollar(5), Money.dollar(6))
        XCTAssertNotEqual(Money.franc(5), Money.dollar(5))
    }
    
    func test_currency() {
        XCTAssertEqual("USD", Money.dollar(1).currency())
        XCTAssertEqual("CHF", Money.franc(1).currency())
    }
    
    func test_simple_addition() {
        let five = Money.dollar(5)
        let sum = five.plus(Money.dollar(5))
        let bank = Bank()
        let reduced = bank.reduce(sum, "USD")
        XCTAssertEqual(Money.dollar(10), reduced)
    }
    
    func test_plus_returns_sum() {
        let five = Money.dollar(5)
        let result = five.plus(five)
        let sum: Sum = result as! Sum
        XCTAssertEqual(five, sum.augend)
        XCTAssertEqual(five, sum.addend)
    }
    
    func test_reduce_sum() {
        let sum = Sum(Money.dollar(3), Money.dollar(4))
        let bank = Bank()
        let result = bank.reduce(sum, "USD")
        XCTAssertEqual(Money.dollar(7), result)
    }
    
    func test_reduce_money() {
        let bank = Bank()
        let result = bank.reduce(Money.dollar(1), "USD")
        XCTAssertEqual(Money.dollar(1), result)
    }
}
