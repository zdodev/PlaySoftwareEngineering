import XCTest

class StringTests: XCTestCase {
    func test_split_string_withInput_substring_array() {
        let inputString = "1,2"
        
        let result = inputString.split(separator: ",")
        
        let expectedValue: [Substring] = ["1", "2"]
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_replacingOccurrences_string_withInput_string() {
        let inputString = "(1,2)"
        
        let result = inputString
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
        
        let expectedValue = "1,2"
        XCTAssertEqual(result, expectedValue)
    }
}
