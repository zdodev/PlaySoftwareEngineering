import XCTest

class Tests: XCTestCase {
    func test_multiplication() {
        var five = Dollar(5)
        five.times(2)
        XCTAssertEqual(10, five.amount)
    }
}
