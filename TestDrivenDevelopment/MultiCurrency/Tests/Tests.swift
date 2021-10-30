import XCTest

class Tests: XCTestCase {
    func test_multiplication() {
        var five = Dollar(5)
        var product = five.times(2)
        XCTAssertEqual(10, product.amount)
        product = five.times(3)
        XCTAssertEqual(15, product.amount)
    }
}
