import Foundation

final class ViewModel {
    var dateTimeString = "Loading..." {
        didSet {
            onUpdated()
        }
    }
    var onUpdated = {}
    
    private let service = Service()
    
    func moveDay(day: Int) {
        let model = service.moveDay(day: day)
        dateTimeString = dateToString(date: model.currentDateTime)
    }
    
    func reload() {
        dateTimeString = "Loading..."
        // Model -> ViewModel
        service.fetchNow { model in
            let dateString = self.dateToString(date: model.currentDateTime)
            self.dateTimeString = dateString
        }
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        return formatter.string(from: date)
    }
}
