import XCTest

class Tests: XCTestCase {
    func test_get_change_amount() {
        var machine = VendingMachine()
        machine.putCoin(100)
        XCTAssertEqual(100, machine.getChangeAmount())
        
        machine.putCoin(500)
        XCTAssertEqual(600, machine.getChangeAmount())
    }
    
    func test_return_change_coin_set_one_coin_50() {
        var machine = VendingMachine()
        machine.putCoin(100)
        machine.putCoin(100)
        machine.putCoin(500)
        machine.selectDrink(Drink("Cola", 650))
        expectedCoinSet.add(50)
        XCTAssertEqual(expectedCoinSet, machine.getChangeAmount())
    }
}
