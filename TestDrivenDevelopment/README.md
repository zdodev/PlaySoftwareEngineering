# 테스트 주도 개발(Test Driven Development)

![test-driven-development](assets/test-driven-development.png)

**테스트 주도 개발**이란 프로그램을 작성하기 전에 테스트를 먼저 작성하며 프로그램을 작성해나가는 개발 방법입니다. 이 테스트 주도 개발의 목표는 **잘 동작하는 깔끔한 코드**입니다.

```swift
func letsTDD() {
    while 모든_경우의_테스트를_작성하지_않았을_경우 {
        - 🔴 빨강: 실패하는 테스트를 작성하는 단계입니다. 컴파일이 되지 않거나 테스트를 통과할 수 없는 단계입니다.
        - 🟢 초록: 테스트를 통과해야 하는 단계입니다. 최소한의 코드로 테스트가 통과하도록 구현합니다.
        - 🔵 파랑: 구현한 코드를 리팩터링하는 단계입니다. 구현한 코드를 좋은 구조로 개선합니다.
    }
}
```

### 테스트 주도 개발의 장점

- 개발 방향을 잃지 않게 유지해줍니다.
- 품질 높은 소프트웨어 모듈을 보유하게 됩니다.
- 자동화된 유닛 테스트 케이스를 갖게 됩니다.
- 작성한 테스트 케이스는 상세화된 모듈 사용 설명서이며, 의사소통의 수단이 됩니다.
- 설계를 개선할 수 있습니다.

## 유닛 테스트(Unit Test)

유닛 테스트란 컴퓨터 프로프그래밍에서 소스코드의 특정 모듈이 의도된 대로 정확히 작동하는지 검증하는 절차입니다. 즉 모든 함수와 메서드에 대한 테스트 케이스를 작성하는 절차를 말합니다.

## TDD의 세 가지 원칙

1. 실패하는 단위 테스트를 작성할 때까지 실제 코드를 작성하지 않습니다.
2. 컴파일은 실패하지 않으면서 실행이 실패하는 정도로만 단위 테스트를 작성합니다.
3. 현재 실패하는 테스트를 통과할 정도로만 실제 코드를 작성합니다.

테스트 코드는 실제 코드 못지않게 중요합니다. 그러므로 테스트 코드도 실제 코드 못지않게 깨끗하게 작성해야 합니다. 테스트는 코드에 유연성과 유지보수성 그리고 재사용성을 제공합니다. 왜? 테스트 케이스가 있으면 변경이 두렵지 않으니까요. 변경이 두렵지 않으면 더 좋은 코드로 변경하는 것을 주저하지 않습니다.

🤔 테스트 당 assert 문은 하나로 제한하는 것이 좋을까요? 여러 assert를 사용하도록 하는 것이 좋을까요?

- assert 문이 하나라면 하나의 테스트를 이해하는 것이 수월하다는 장점이 있지만 중복되는 코드가 많아질 수 있습니다.
- 하나의 개념 당 assert 문 수를 최소로 줄이고, 테스트 함수 하나는 개념 하나만 테스트하는 것이 좋습니다.

## F.I.R.S.T. 원칙

- Fast, 빠르게: 테스트는 빨라야 합니다.
- Independent, 독립적으로: 각 테스트는 서로 의존하면 안 됩니다.
- Repeatable, 반복 가능하게: 테스트는 어떤 환경에서도 반복 가능해야 합니다. 실제 환경, QA 환경, 네트워크가 연결되지 않은 컴퓨터에서도 실행할 수 있어야 합니다.
- Self-Validating, 자가검증하는: 테스트는 bool 값으로 결과를 내야 합니다.
- Timely, 적시에: 테스트는 적시에 작성해야 합니다. 테스트를 먼저 작성하고 실제 코드를 구현해야 합니다.

### SUT(System Under Test)

테스트 대상 시스템, 즉 테스트를 하려는 대상을 칭합니다.

### 유닛 테스트 스타일

- Given -> When -> Then
    - Given은 테스트 시나리오에서 수행할 동작을 시작하기 전에 상태를 말합니다. 테스트의 사전 조건으로 볼 수 있습니다.
    - When은 테스트 수행할 동작을 말합니다.
    - Then은 수행한 동작으로 인해 예상되는 변경을 말합니다. 테스트가 예상한 대로 동작하는지 확인합니다.
- Arrange -> Act -> Assert
- Setup -> Exercies -> Verify

### 테스트 메서드명 작성 기준

- test: test 접두사로 시작해야 테스트 메서드로 인식합니다.
- unit of work: 행위를 작성합니다.
- state: 입력값과 초기 상태를 작성합니다.
- outcome: 예상하는 결과값을 작성합니다.
- 각 명칭 사이에 '_' 를 사용하여 구분합니다.

![testNaming](assets/testNaming.png)

테스트를 작성할 때 테스트에게 비교하는 요구하는 구문을 작성하니 좋지 않은 테스트라고 생각이 들었습니다. output 결과에 대해 일반화할 수 없었기 때문입니다.

```swift
// 테스트가 결과를 직접 비교하는 구문
XCTAssertTrue(output[0] > output[1])
```

다음과 같이 작성하니 테스트를 일반화할 수 있어 더 범용적이라고 생각이 들었습니다.

```swift
XCTAssertTrue(solution.isSameScore(output))
```

### 네트워크에 강하게 의존하고 있을 때, F.I.R.S.T. 원칙 중 Repeatable 원칙을 지키는 테스트를 작성하기 위해서는?

네트워크나 여러 사이트 이펙트에 강하게 커플링이 되어있는 객체를 가지고 테스트를 할 때, 외부에서 가짜 데이터를 제공하는 어떤 스텁이나 목객체를 넣고 동작을 테스트하는 것이 테스트 기법의 하나입니다.

## Mock에 대한 기본적인 분류, 테스트 더블(Test Double)

### 더미 객체(Dummy Object)

더미 객체는 말 그대로 모조품, 단순한 껍데기에 해당합니다. 단지 인스턴스화된 객체가 필요할 뿐 해당 객체의 기능까지는 필요하지 않은 경우에 사용합니다.

### 테스트 스텁(Test Stub)

테스트 스텁은 더미 객체보다 더 발전한 형태입니다. 테스트 스텁은 더미 객체가 마치 실제로 동작하는 것처럼 보이게 구현한 객체입니다. 객체의 특정 상태를 가정해서 만든 구현체라고 볼 수 있습니다. 테스트에 필요한 부분만 하드코딩하여 기능을 제공합니다.

### 페이크 객체(Fake Object)

페이크 객체는 여러 개의 인스턴스를 대표할 수 있는 경우이거나, 좀 더 복잡한 구현이 들어가 있는 객체를 말합니다. 복잡한 로직이나 객체 내부에서 필요로 하는 다른 외부 객체들의 동작을, 비교적 단순화하여 구현한 객체입니다.

### 테스트 스파이(Test Spy)

테스트에 사용되는 객체에 대해서도, 특정 객체가 사용됐는지, 그리고 그 객체의 예상된 메서드가 정상적으로 호출됐는지를 확인해야 하는 상황이 발생합니다. 보통은 호출 여부를 몰래 감시해서 기록했다가, 나중에 요청이 들어오면 해당 기록 정보를 전달해줍니다. 그런 목적으로 만들어진 객체를 테스트 스파이라고 부릅니다.

### Mock 객체(Mock Object)

Mock 객체는 행위를 검증하기 위해 사용하는 객체입니다. 분류상 행위 기반 테스트를 위해 사용하는 객체로 분류되지만 현재는 더 일반적이고 넓은 의미의 '가상 임시 구현체'의 의미로 사용됩니다.

### Mock 프레임워크

Mock 프레임워크는 동적으로 Mock 객체를 만들어주는 프레임워크입니다. Mock 프레임워크의 장점은 Mock 객체를 직접 작성하지 않아도 되며, 행위까지도 테스트 케이스에 포함시킬 수 있습니다.

## BankBusiness

은행 계좌 개설을 TDD로 구현한 기록입니다.

### 참고 링크

---

> [도서: 테스트 주도 개발](https://book.naver.com/bookdb/book_detail.nhn?bid=7443642)
>
> [도서: Clean Code](https://book.naver.com/bookdb/book_detail.nhn?bid=7390287)
>
> [도서: 테스트 주도 개발 TDD 실천법과 도구](https://book.naver.com/bookdb/book_detail.nhn?bid=6291557)
>
> [Wiki Unit Testing](https://en.wikipedia.org/wiki/Unit_testing)
>
> [Apple Testing Your Apps in Xcode](https://developer.apple.com/documentation/xcode/testing-your-apps-in-xcode)
>
> [Apple Unit Testing Apps and Frameworks Sample Code](https://developer.apple.com/library/archive/samplecode/UnitTests/Introduction/Intro.html#//apple_ref/doc/uid/DTS40011742)
>
> [Martin Fowler GivenWhenThen](https://martinfowler.com/bliki/GivenWhenThen.html)
>
> [xUnit Patterns Four-Phase Test](http://xunitpatterns.com/Four%20Phase%20Test.html)
>
> [Swift by Sundell Unit Testing](https://www.swiftbysundell.com/discover/unit-testing/)
>
> [GitHub Cuckoo - Swift mocking framework](https://github.com/Brightify/Cuckoo)
>
> [GitHub Mockingbird - Swift mocking framework](https://github.com/birdrides/mockingbird/)
>
> [GihHub SwiftMock - Swift mocking framework](https://github.com/mflint/SwiftMock)
>
> [YouTube Let's TDD - 전수열](https://www.youtube.com/watch?v=meTnd09Pf_M)

