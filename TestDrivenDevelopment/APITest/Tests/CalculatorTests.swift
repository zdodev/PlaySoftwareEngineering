import XCTest

class CalculatorTests: XCTestCase {
    let calculator = Calculator()
    
    func test_emptystring_return_zero() {
        XCTAssertEqual(try calculator.calculate(""), 0)
    }
    
    func test_single_value_is_replied() {
        XCTAssertEqual(try calculator.calculate("1"), 1)
    }
    
    func test_two_numbers_comma_delimited_return_sum() {
        XCTAssertEqual(try calculator.calculate("1,2"), 3)
    }
    
    func test_two_numbers_new_line_delimited_retune_sum() {
        XCTAssertEqual(try calculator.calculate("1\n2"), 3)
    }
    
    func test_three_numbers_delimited_both_ways_retun_sum() {
        XCTAssertEqual(try calculator.calculate("1,2,3"), 6)
    }
    
    func test_negative_input_returns_exception() {
        XCTAssertThrowsError(try calculator.calculate("-1"))
    }
    
    func test_ignores_number_greater_than_1000() {
        XCTAssertEqual(try calculator.calculate("10,10,1001"), 20)
    }
}
 
