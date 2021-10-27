import XCTest

class StringTests: XCTestCase {
    func test_split_string_withInput_substring_array() {
        let inputString = "1,2"
        
        let result = inputString.split(separator: ",")
        
        let expectedValue: [Substring] = ["1", "2"]
        XCTAssertEqual(result, expectedValue)
    }
}
