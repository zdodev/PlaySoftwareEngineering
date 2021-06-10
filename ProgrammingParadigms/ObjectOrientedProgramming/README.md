# 객체지향 프로그래밍(Object-Oriented Programming)

객체지향 프로그래밍은 컴퓨터 프로그램을 명령어의 목록으로 보는 시각에서 벗어나 여러 개의 독립된 단위, 즉 "객체"들의 모임으로 파악하고자 하는 것입니다. 각각의 객체는 데이터를 주고받고, 데이터를 처리할 수 있습니다. 객체지향 프로그래밍은 프로그램을 유연하고 변경이 용이하게 만들기 때문에 대규모 소프트웨어 개발에 많이 사용합니다. 현대의 많은 프로그래밍 언어가 객체지향 프로그래밍 패러다임을 수용하고 있습니다.

## 객체지향 프로그래밍의 3요소

### 캡슐화, Encapsulation

캡슐화란 내부적으로 기능을 감추는 것을 의미합니다. 이를 통해 결합도를 낮추고 응집도가 높은 객체를 설계할 수 있습니다. 캡슐화는 접근제어자를 통해 제어할 수 있습니다.

```swift
open class SomeOpenClass1 {
    open var someOpenProperty = 0
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate var someFilePrivateProperty = 0
    private var somePrivateProperty = 0
    
    open func someOpenPublicFunction() {}
    public func somePublicFunction() {}
    func someInternalFunction() {}
    fileprivate func someFilePrivateFunction() {}
    private func somePrivateFunction() {}
}
```

### 상속, Inheritance

하나의 클래스는 다른 클래스의 속성과 기능을 그대로 물려받을 수 있습니다. 이것을 상속이라고 합니다.

```swift
class Person {
    let name: String? = nil
}

class Student: Person {
    let school: String? = nil
}
```

### 다형성, Polymorphism

하나의 코드가 각기 다른 행위를 할 수 있는 것을 의미합니다. 다형성은 오버라이딩과 오버로딩을 통해 구현할 수 있습니다.

다음은 오버로딩을 통한 다형성을 구현한 예입니다.

```swift
class Coffee {
    let americano = 2000
    let latte = 2500
    let mocha = 3000
    
    func price() -> Int {
        americano
    }
    
    func price(_ menu: String) -> Int {
        if menu == "latte" {
            return latte
        } else if menu == "mocha" {
            return mocha
        } else {
            return americano
        }
    }
}

let coffee = Coffee()
print(coffee.price())
print(coffee.price("latte"))
```

## 객체지향 프로그래밍 설계 5원칙(feat. SOLID)

### S, SRP(Single Responsibility Principle)

### O, OCP(Open Closed Principle)

### L, Liskov Substitution Principle

### I, Interface Segregation Principle

### D, Dependency Inversion Principle

## 소프트웨어를 복잡하기 않게 설계하기

### DRY

### KISS

### YAGNI

## TicketSales

- 오브젝트 책의 티켓 판매 애플리케이션을 Swift로 구현해보았습니다.

## Cafe

- [객체지향의 사실과 오해](https://book.naver.com/bookdb/book_detail.nhn?bid=9145968) 책 후반부에 나오는 커피 전문점 도메인에 따라 코드를 작성해보았습니다.

### 참고 링크

---

> [Wiki Object-oriented programming](https://en.wikipedia.org/wiki/Object-oriented_programming#Encapsulation)
