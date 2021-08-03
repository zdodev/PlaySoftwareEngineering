import Foundation

final class Service {
    private var currentModel = Model(currentDateTime: Date())
    private let repository = Repository()
    
    func fetchNow(onCompleted: @escaping (Model) -> Void) {
        // Entity -> Model
        repository.fetchNow { entity in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
            guard let now = formatter.date(from: entity.currentDateTime) else {
                return
            }
            
            let model = Model(currentDateTime: now)
            self.currentModel = model
            onCompleted(model)
        }
    }
    
    func moveDay(day: Int) -> Model {
        guard let moveDay = Calendar.current.date(byAdding: .day, value: day, to: currentModel.currentDateTime) else {
            return Model(currentDateTime: Date())
        }
        let model = Model(currentDateTime: moveDay)
        currentModel = model
        return currentModel
    }
}
