## 스택

스택은 나중에 입력된 것이 먼저 출력되는 LIFO(Last In First Out) 데이터 구조를 나타냅니다. LIFO 구조는 접시를 쌓아 올린 모습과 같으며, 사용자는 쌓아 올린 접시 중 맨 마지막으로 놓은 접시를 가장 먼저 꺼내서 사용합니다. 스택은 배열과 유사하지만, 개별 요소에 접근하기 위한 메서드가 좀 더 제한적입니다. 또한 개별 요소에 대한 무작위 접근을 허용하는 배열과 달리, 스택은 개별 요소에 접근하는 방법을 강하게 제한한 인터페이스를 제공합니다.

스택은 ADT(Abstact Data Type)으로 배열 또는 연결 리스트로 구현할 수 있습니다.

스택에서 가장 중요한 연산은 다음과 같습니다.

-   push: 스택의 최상단에 요소를 추가합니다. (Create)
-   pop: 스택 최상단의 요소를 꺼내서 반환합니다. (Delete)

그 외에 스택에서 제공할 수 있는 연산은 다음과 같습니다. 필요에 따라 구현해볼 수 있겠습니다.

-   peek: 스택 최상단의 요소를 꺼내지 않고 반환합니다.
-   count: 스택에 저장된 요소의 수를 반환합니다.
-   isEmpty: 스택이 비어있는지 확인합니다.
-   isFull: 스택이 꽉차있는지 확인합니다.

### 탐색/삭제

스택은 데이터를 최상단에서만 다루므로 중간에 데이터의 탐색, 수정 및 삭제하기에는 그 목적이 맞지 않습니다.

### 참고 링크

---

>   [Wikipedia Stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type))
>
>   [Stack and its basic Operations](https://afteracademy.com/blog/stack-and-its-basic-operations)