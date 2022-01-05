// 옵저버 프로토콜
protocol PropertyObserver: AnyObject {
    func willChange(propertyName: String, newPropertyValue: Any?)
    func didChange(propertyName: String, oldPropertyValue: Any?)
}

// 관찰 대상자
final class TestChambers {
    // 옵저버
    weak var observer: PropertyObserver?
    
    private let testChamberNumberName = "testChamberNumber"
    
    init(observer: PropertyObserver?) {
        self.observer = observer
    }
    
    // 관찰 대상 프로퍼티
    var testChamberNumber = 0 {
        willSet {
            observer?.willChange(propertyName: testChamberNumberName, newPropertyValue: newValue)
        }
        didSet {
            observer?.didChange(propertyName: testChamberNumberName, oldPropertyValue: oldValue)
        }
    }
}

// 관찰자(관찰자 프로토콜 채택)
final class Observer: PropertyObserver {
    // willChange 정의
    func willChange(propertyName: String, newPropertyValue: Any?) {
        if newPropertyValue as? Int == 1 {
            print("Okay. Look. We both said a lot of things that you're going to regret.")
        }
    }
    
    // didChange 정의
    func didChange(propertyName: String, oldPropertyValue: Any?) {
        if oldPropertyValue as? Int == 0 {
            print("Sorry about the mess. I've really let the place go since you killed me.")
        }
    }
}

