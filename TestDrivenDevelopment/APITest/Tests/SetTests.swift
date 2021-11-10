import XCTest

class SetTests: XCTestCase {
    private var numbers: Set<Int> = []
    
    override func setUpWithError() throws {
        numbers.removeAll()
        numbers.insert(1)
        numbers.insert(1)
        numbers.insert(2)
        numbers.insert(3)
    }
    
    func test_주어진_집합_원소의_수는_3개다() {
        let result = numbers.count
        
        let expectedValue = 3
        XCTAssertEqual(result, expectedValue)
    }
}
