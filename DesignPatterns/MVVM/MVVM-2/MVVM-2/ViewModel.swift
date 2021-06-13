import Foundation

class ViewModel {
    var dateTimeString = "Loading..." {
        didSet {
            onUpdated()
        }
    }
    var onUpdated: () -> Void = {}
    
    private var service = Service()
    
    func moveDay(day: Int) {
        service.moveDay(day: day)
        dateTimeString = dateToString(date: service.currentModel.currentDateTime)
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
