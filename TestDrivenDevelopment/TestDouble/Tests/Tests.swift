import XCTest

final class Tests: XCTestCase {
    private let dummy = OtherRepository()
    
    func test_dummy() {
        let manager = TestNetworkManager()
        let _ = AccountService(manager: manager, repository: dummy)
    }
    
    func test_stub() {
        let manager = NetworkManagerStub()
        let sut = AccountService(manager: manager, repository: dummy)
        
        let result = sut.fetchUser(id: "", password: "")
        XCTAssertNil(result)
    }
    
    func test_fake() {
        let manager = NetworkManagerFake()
        let sut = AccountService(manager: manager, repository: dummy)
        
        let user = sut.fetchUser(id: "a", password: "123")
        XCTAssertEqual(user, User(id: "a", password: "123"))
        
        let nilUser = sut.fetchUser(id: "", password: "")
        XCTAssertNil(nilUser)
        
        sut.createUser(id: "b", password: "234")
        guard let newUser = sut.fetchUser(id: "b", password: "234") else {
            XCTFail()
            return
        }
        XCTAssertEqual(newUser, User(id: "b", password: "234"))
    }
    
    func test_spy() {
        let manager = NetworkManagerSpy()
        let sut = AccountService(manager: manager, repository: dummy)
        
        let fetchUser = sut.fetchUser(id: "", password: "")
        XCTAssertNil(fetchUser)
        
        let fetchCount = manager.fetchUserCallCount
        XCTAssertEqual(fetchCount, 1)
        
        sut.createUser(id: "a", password: "123")
        let createCount = manager.createUserCallCount
        XCTAssertEqual(createCount, 1)
    }
    
    func test_mock() {
        let manager = TestNetworkManagerMock()
        let sut = AccountService(manager: manager, repository: dummy)
        
        sut.createUser(id: "a", password: "123")
        XCTAssertEqual(manager.createUserCallCount, 1)
        
        guard let user = sut.fetchUser(id: "a", password: "123") else {
            XCTFail()
            return
        }
        XCTAssertEqual(User(id: "a", password: "123"), user)
    }
}
