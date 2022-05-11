struct User: Equatable {
    let id: String
    let password: String
}

var database = [
    "a": "123",
    "b": "234"
]

protocol TestNetworkManagerType {
    func createUser(id: String, password: String)
    func fetchUser(id: String, password: String) -> User?
}

struct TestNetworkManager: TestNetworkManagerType {
    func createUser(id: String, password: String) {
        database[id] = password
    }
    
    func fetchUser(id: String, password: String) -> User? {
        if database[id] == password {
            return User(id: id, password: password)
        }
        
        return nil
    }
}

struct AccountService {
    private let manager: TestNetworkManagerType
    private let repository: OtherRepository
    
    init(manager: TestNetworkManagerType, repository: OtherRepository) {
        self.manager = manager
        self.repository = repository
    }
    
    func createUser(id: String, password: String) {
        manager.createUser(id: id, password: password)
    }
    
    func fetchUser(id: String, password: String) -> User? {
        manager.fetchUser(id: id, password: password)
    }
}

// MARK: - dummy

struct OtherRepository {}

// MARK: - stub

struct NetworkManagerStub: TestNetworkManagerType {
    func createUser(id: String, password: String) {
        // pass
    }
    
    func fetchUser(id: String, password: String) -> User? {
        nil
    }
}

// MARK: - fake

final class NetworkManagerFake: TestNetworkManagerType {
    private var database = ["a": "123"]
    
    func createUser(id: String, password: String) {
        database[id] = password
    }
    
    func fetchUser(id: String, password: String) -> User? {
        if database[id] == password {
            return User(id: id, password: password)
        }
        
        return nil
    }
}

// MARK: - spy

final class NetworkManagerSpy: TestNetworkManagerType {
    var createUserCallCount = 0
    var fetchUserCallCount = 0
    var latestCreateUser: User?
    
    func createUser(id: String, password: String) {
        latestCreateUser = User(id: id, password: password)
        createUserCallCount += 1
    }
    
    func fetchUser(id: String, password: String) -> User? {
        fetchUserCallCount += 1
        return latestCreateUser
    }
}

// MARK: - mock

final class TestNetworkManagerMock: TestNetworkManagerType {
    typealias Account = (id: String, password: String)
    
    private var database = [String: String]()
    var createUserCallCount = 0
    var fetchUserCallCount = 0
    var createUser: Account?
    var fetchUser: Account?
    
    func createUser(id: String, password: String) {
        createUserCallCount += 1
        createUser = (id, password)
        database[id] = password
    }
    
    func fetchUser(id: String, password: String) -> User? {
        fetchUserCallCount += 1
        fetchUser = (id, password)
        if database[id] == password {
            return User(id: id, password: password)
        }
        
        return nil
    }
}
