import XCTest

class Tests: XCTestCase {
    private var account: Account!
    
    override func setUp() {
        account = Account(10_000)
    }
    
    func test_계좌가_성공적으로_생성된다() {
        XCTAssertNotNil(account)
    }
    
    func test_초기_잔액을_설정한다() {
        XCTAssertEqual(10_000, account.balance)

        account = Account(1_000)
        XCTAssertEqual(1_000, account.balance)

        account = Account(0)
        XCTAssertEqual(0, account.balance)
    }

    func test_입금_후_잔고가_동일한지_비교한다() {
        account.deposit(1_000)
        XCTAssertEqual(11_000, account.balance)
    }

    func test_출금_후_잔고가_동일한지_비교한다() {
        account.withdraw(1_000)
        XCTAssertEqual(9_000, account.balance)
    }
}
