import Foundation

class Service {
    var currentModel = Model(currentDateTime: Date())
    
    private let repository = Repository()
    
    func fetchNow(onCompleted: @escaping (Model) -> Void) {
        // Entity -> Model
        repository.fetchNow { [weak self] entity in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
            guard let now = formatter.date(from: entity.currentDateTime) else {
                return
            }
            
            let model = Model(currentDateTime: now)
            self?.currentModel = model
            onCompleted(model)
        }
    }
    
    func moveDay(day: Int) {
        guard let moveDay = Calendar.current.date(byAdding: .day, value: day, to: currentModel.currentDateTime) else {
            return
        }
        currentModel.currentDateTime = moveDay
    }
}
