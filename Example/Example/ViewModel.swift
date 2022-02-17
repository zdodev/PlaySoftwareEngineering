import Combine

final class ViewModel: ObservableObject {
    @Published var count = 0
    
    func increaseCount() {
        count += 1
    }
    
    func decreaseCount() {
        count -= 1
    }
}
