import XCTest

class CalculatorTests: XCTestCase {
    let calculator = StringCalculator()
    
    func test_return_zero_given_emtpy_string() {
        let result = calculator.add("")
        
        XCTAssertEqual(result, 0)
    }
    
    func test_return_1_given_string_with_1() {
        let result = calculator.add("1")
        
        XCTAssertEqual(result, 1)
    }
    
    func test_return_2_given_string_with_2() {
        let result = calculator.add("2")
        
        XCTAssertEqual(result, 2)
    }
    
    func test_returns_sum_given_string_with_two_comma_separated_numbers() {
        let result = calculator.add("1,2")
        
        XCTAssertEqual(result, 3)
    }
    
    func test_returns_sum_given_string_with_two_comma_separated_numbers1() {
        let result = calculator.add("2,3")
        
        XCTAssertEqual(result, 5)
    }
    
    func test_returns_sum_given_string_with_three_comma_or_newline_separated_numbers() {
        let result = calculator.add("1\n2,3")
        
        XCTAssertEqual(result, 6)
        
        let result1 = calculator.add("1\n2\n3")
        
        XCTAssertEqual(result1, 6)
        
        let result2 = calculator.add("1,2\n3")
        
        XCTAssertEqual(result2, 6)
        
        let result3 = calculator.add("1;2\n3")
        
        XCTAssertEqual(result3, 6)
        
        let result4 = calculator.add("1\\2\n3")
        
        XCTAssertEqual(result4, 6)
    }
}
 
