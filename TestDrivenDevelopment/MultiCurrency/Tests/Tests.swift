import XCTest

class Tests: XCTestCase {
    func test_multiplication() {
        let five = Dollar(5)
        XCTAssertEqual(Dollar(10), five.times(2))
        XCTAssertEqual(Dollar(15), five.times(3))
    }
    
    func test_equality() {
        XCTAssertEqual(Dollar(5), Dollar(5))
        XCTAssertNotEqual(Dollar(5), Dollar(6))
    }
    
    func test_franc_multiplication() {
        let five = Franc(5)
        XCTAssertEqual(Franc(10), five.times(2))
        XCTAssertEqual(Franc(15), five.times(3))
    }
}
