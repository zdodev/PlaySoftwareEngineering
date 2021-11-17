## 목표

- 통화가 다른 두 금액을 더해서 주어진 환율레 맞게 변한 금액을 결과로 얻을 수 있어야 한다.
- 어떤 금액(주가)을 어떤 수(주식의 수)에 곱한 금액을 결과로 얻을 수 있어야 한다.

## Step 1 Multi-Currency Money

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - **$5 x 2  = $10**
> - amount를 private으로 만들기
> - Dollar 부작용(side effect)?
> - Money 반올림?

- 우리가 알고 있는 작업해야 할 테스트 목록을 만들었다.
- 오퍼레이션이 외부에서 어떻게 보이길 원하는지 말해주는 이야기를 코드로 표현했다.
- JUnit에 대한 상세한 사항들은 잠시 무시하기로 했다.
- 스텁 구현을 통해 테스트를 컴파일했다.
- 끔찍한 죄악을 범하여 테스트를 통과시켰다.
- 돌아가는 코드에서 상수를 변수로 변경하여 점진적으로 일반화했다.
- 새로운 할일들을 한번에 처리하는 대신 할일 목록에 추가하고 넘어갔다.

## Step 2 Degenerate Objects

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - ~~$5 x 2  = $10~~
> - amount를 private으로 만들기
> - **Dollar 부작용?**
> - Money 반올림?

- 설계상의 경함(Dollar 부작용)을 그 결함으로 인해 실패하는 테스트로 변환했다.
- 스텁 구현으로 빨게 컴파일을 통과하도록 만들었다.
- 올바르다고 생각하는 코드를 입력하여 테스트를 통과했다.

## Step 3 Equality for All

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - ~~$5 x 2  = $10~~
> - amount를 private으로 만들기
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - **equals()**
> - hashCode()
> - Equal null
> - Equal object

- 우리는 디자인 패턴(값 객체, value object)이 하나의 또 다른 오퍼레이션을 암시한다는 걸 알아챘다.
- 해당 오퍼레이션을 테스트했다.
- 해당 오퍼레이션을 간단히 구현했다.
- 곧장 리팩토링하는 대신 테스트를 조금 더 했다.
- 두 경우를 모두 수용할 수 있도록 리팯토링했다.(일반화)

## Step 4 Privacy

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - ~~$5 x 2  = $10~~
> - **amount를 private으로 만들기**
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object

- 오직 테스트를 향상시키기 위해서만 개발된 기능을 사용했다.
- 두 테스트가 동시에 실패하면 망한다는 점을 인식했다.
- 위험 요소가 있음에도 계속 진행했다.
- 테스트와 코드 사이의 결합도를 낮추기 위해, 테스트하는 객체의 새 기능을 사용했다.

## Step 5 Franc-ly Speaking

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - **5CHF X 2 = 10CHF**
> - Dollar/Franc 중복
> - 공용 equals
> - 공용 times

- 큰 테스트를 공략할 수 없다. 그래서 진전을 나타낼 수 있는 자그마한 테스트를 만들었다.
- 뻔뻔스럽게도 중복을 만들고 조금 고쳐서 테스트를 작성했다.
- 설상가상으로 모델 코드까지 도매금으로 복사하고 수정해서 테스트를 통과했다.
- 중복이 사라지기 전에는 집에 가지 않겠다고 약속했다.

## Step 6 Equality for All, Redux

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - ~~5CHF X 2 = 10CHF~~
> - Dollar/Franc 중복
> - **공용 equals**
> - 공용 times

- 공통된 코드를 첫 번째 클래스(Dollar)에서 상위 클래스(Money)로 단계적으로 옮겼다.
- 두 번째 클래스(Franc)도 Money의 하위 클래스로 만들었다.
- 불필요한 구현을 제거하기 전에 두 equals() 구현을 일치시켰다.

## Step 7 Apples and Oranges

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - ~~5CHF X 2 = 10CHF~~
> - Dollar/Franc 중복
> - ~~공용 equals~~
> - 공용 times
> - **Franc와 Dollar 비교하기**

- 우릴 괴롭히던 결함을 끄집어내서 테스트에 담아냈다.
- 완벽하진 않지만 그럭저럭 봐줄 만한 방법 (getClass())으로 테스트를 통과하게 만들었다.
- 더 많은 동기가 있기 전에는 더 많은 설계를 도입하지 않기로 했다.

## Step 8 Makin' Objects

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - ~~5CHF X 2 = 10CHF~~
> - **Dollar/Franc 중복**
> - ~~공용 equals~~
> - 공용 times
> - ~~Franc와 Dollar 비교하기~~
> - 통화?

- 동일한 메서드(times)의 두 변이형 메서드 서명부를 통일시킴으로써 중복 제거를 향해 한 단계 더 전진했다.
- 최소한 메서드 선언부만이라도 공통 상위 클래스(superclass)로 옮겼다.
- 팩토리 메서드를 도입하여 테스트 코드에서 콘크리트 하위 클래스의 존재 사실을 분리해냈다.
- 하위 클래스가 사라지면 몇몇 테스트는 불필요한 여분의 것이 된다는 것을 인식했다. 하지만 일단 그냥 뒀다.

## Step 9 Times We're Livin' In

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - ~~5CHF X 2 = 10CHF~~
> - Dollar/Franc 중복
> - ~~공용 equals~~
> - 공용 times
> - ~~Franc와 Dollar 비교하기~~
> - **통화?**
> - testFrancMultiplication 제거

- 큰 설계 아이디어를 다루다가 조금 곤경에 빠졌다. 그래서 좀 전에 주목했던 더 작은 작업을 수행했다.
- 다른 부분들을 호출자(팩토리 메서드)로 옮김으로써 두 생성자를 일치시켰다.
- times()가 팩토리 메서드를 사용하도록 만들기 위해 리팩토링을 잠시 중단했다.
- 비슷한 리팩토링(Franc에 했던 일을 Dollar에도 적용)을 한번의 큰 단계로 처리했다.
- 동일한 생성자들을 상위 클래스로 올렸다.

## Step 10 Interesting Times

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - ~~5CHF X 2 = 10CHF~~
> - Dollar/Franc 중복
> - ~~공용 equals~~
> - **공용 times**
> - ~~Franc와 Dollar 비교하기~~
> - ~~통화?~~
> - testFrancMultiplication 제거

- 두 times()를 일치시키기 위해 그 메서드들이 호출하는 다른 메서드들을 인라인시킨 후 상수를 변수로 바꿔주었다.
- 단지 디버깅을 위해 테스트 없이 toString()을 작성했다.
- Franc 대신 Money를 반환하는 변경을 시도한 뒤 그것이 잘 작동할지를 테스트가 말하도록 했다.
- 실험해본 걸 뒤로 물리고 또 다른 테스트를 작성했다. 테스트를 작동했더니 실험도 제대로 작동했다.

## Step 11 The Root of All Evil

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - ~~5CHF X 2 = 10CHF~~
> - **Dollar/Franc 중복**
> - ~~공용 equals~~
> - ~~공용 times~~
> - ~~Franc와 Dollar 비교하기~~
> - ~~통화?~~
> - testFrancMultiplication 제거

- 하위 클래스의 속을 들어내는 걸 완료하고, 하위 클래스를 삭제했다.
- 기존의 소스 구조에서는 필요했지만 새로운 구조에서는 필요 없게 된 테스트를 제거했다.

## Step 12 Addition, Finally

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - **$5 + $5 = $10**
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - ~~5CHF X 2 = 10CHF~~
> - ~~Dollar/Franc 중복~~
> - ~~공용 equals~~
> - ~~공용 times~~
> - ~~Franc와 Dollar 비교하기~~
> - ~~통화?~~
> - ~~testFrancMultiplication 제거~~

- 큰 테스트를 작은 테스트($5 + 10CHF에서 $5 + $5로)로 줄여서 발전을 나타낼 수 있도록 했다.
- 우리에게 필요한 계산(computation)에 대한 가능한 메타포들을 신중히 생각해봤다.
- 새 메타포에 기반하여 기존의 테스트를 재작성했다.
- 테스트를 빠르게 컴파일했다.
- 그리고 테스트를 실행했다.
- 진짜 구현을 만들기 위해 필요한 리팩토링을 약간의 전율과 함께 기대했다.

## Step 13 Make it

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - **$5 + $5 = $10**
> - $5 + $5에서 Money 반환하기
> - **Bank.reduce(Money)**
> - Money에 대한 통화 변환을 수행하는 Reduce
> - Reduce(Bank, String)
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - ~~5CHF X 2 = 10CHF~~
> - ~~Dollar/Franc 중복~~
> - ~~공용 equals~~
> - ~~공용 times~~
> - ~~Franc와 Dollar 비교하기~~
> - ~~통화?~~
> - ~~testFrancMultiplication 제거~~

- 모든 중복이 제거되지 전까지는 테스트를 통과한 것으로 치지 않았다.
- 구현하기 위해 역방향이 아닌 순방향으로 작업했다.
- 앞으로 필요할 것으로 예상되는 객체(Sum)의 생성을 강요하기 위한 테스트를 작성했다.
- 빠른 속도로 구현하기 시작했다.(Sum의 생성자)
- 일단 한 곳에 캐스팅을 이용해서 코드를 구현했다가, 테스트가 돌아가자 그 코드를 적당한 자리로 옮겼다.
- 명시적인 클래스 검사를 제거하기 위해 다형성을 사용했다.

## Step 14 Change

> - $5 + 10CHF = $10(환율이 2:1일 경우)
> - **$5 + $5 = $10**
> - $5 + $5에서 Money 반환하기
> - ~~Bank.reduce(Money)~~
> - **Money에 대한 통화 변환을 수행하는 Reduce**
> - **Reduce(Bank, String)**
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - ~~5CHF X 2 = 10CHF~~
> - ~~Dollar/Franc 중복~~
> - ~~공용 equals~~
> - ~~공용 times~~
> - ~~Franc와 Dollar 비교하기~~
> - ~~통화?~~
> - ~~testFrancMultiplication 제거~~

- 필요할 거라고 생각한 인자를 빠르게 추가했다.
- 코드와 테스트 사이에 있는 데이터 중복을 끄집어냈다.
- 자바의 오퍼레이션에 대한 가정을 검사해보기 위한 테스트(testArrayEquals)를 작성했다.
- 별도의 테스트 없이 전용(private) 도우미(helper) 클래스를 만들었다.
- 리팩토링하다가 실수를 했고, 그 문제를 분리하기 위해 도 하나의 테스트를 작성하면서 계속 전진해 가기로 선택했다.

## Step 15 Mixed Currencies

> - **$5 + 10CHF = $10(환율이 2:1일 경우)**
> - ~~$5 + $5 = $10~~
> - $5 + $5에서 Money 반환하기
> - ~~Bank.reduce(Money)~~
> - ~~Money에 대한 통화 변환을 수행하는 Reduce~~
> - ~~Reduce(Bank, String)~~
> - Sum.plus
> - Expression.times
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - ~~5CHF X 2 = 10CHF~~
> - ~~Dollar/Franc 중복~~
> - ~~공용 equals~~
> - ~~공용 times~~
> - ~~Franc와 Dollar 비교하기~~
> - ~~통화?~~
> - ~~testFrancMultiplication 제거~~

- 원하는 테스트를 작성하고, 한 단계에 달성할 수 있도록 뒤로 물렀다.
- 좀더 추상적인 선언을 통해 가지에서 부리(애초의 테스트 케이스)로 일반화했다.
- 변경 후 (Expression fiveBucks), 그 영향을 받은 다른 부분들을 변경하기 위해 컴파일러의 지시를 따랐다(Expression에 plus()를 추가하기 등등).

## Step 16 Abstraction, Finally

> - ~~$5 + 10CHF = $10(환율이 2:1일 경우)~~
> - ~~$5 + $5 = $10~~
> - **$5 + $5에서 Money 반환하기**
> - ~~Bank.reduce(Money)~~
> - ~~Money에 대한 통화 변환을 수행하는 Reduce~~
> - ~~Reduce(Bank, String)~~
> - ~~Sum.plus~~
> - Expression.times
> - ~~$5 x 2  = $10~~
> - ~~amount를 private으로 만들기~~
> - ~~Dollar 부작용?~~
> - Money 반올림?
> - ~~equals()~~
> - hashCode()
> - Equal null
> - Equal object
> - ~~5CHF X 2 = 10CHF~~
> - ~~Dollar/Franc 중복~~
> - ~~공용 equals~~
> - ~~공용 times~~
> - ~~Franc와 Dollar 비교하기~~
> - ~~통화?~~
> - ~~testFrancMultiplication 제거~~

- 미래에 코드를 읽을 다른 사람들을 염두에 둔 테스트를 작성했다.
- TDD와 여러분의 현재 개발 스타일을 비교해 볼 수 있는 실험 방법을 제시했다.
- 또 한 번 선언부에 대한 수정이 시스템 나머지 부분으로 번져갔고, 문제를 고치기 위해 역시 컴파일러의 조언을 따랐다.
- 잠시 실험을 시도했는데, 제대로 되지 않아서 버렸다.

---

