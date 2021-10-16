import ReactorKit

final class CounterViewReactor: Reactor {
    // Action 정의
    enum Action {
        case increase
    }
    
    // State 정의
    struct State {
        var value = 0
    }
    
    var initialState = State()
    
    enum Mutation {
        case increaseValue
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .increase:
            return Observable.just(Mutation.increaseValue)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .increaseValue:
            newState.value += 1
        }
        
        return newState
    }
}
