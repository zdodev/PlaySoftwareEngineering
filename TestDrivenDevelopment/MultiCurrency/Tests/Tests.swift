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
}
