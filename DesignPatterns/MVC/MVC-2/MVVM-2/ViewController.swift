import UIKit

class ViewController: UIViewController {
    private var currentDateTime = Date()
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchNow()
    }
    
    private func fetchNow() {
        let urlString = "http://worldclockapi.com/api/json/utc/now"
        guard let url = URL(string: urlString) else {
            return
        }
        
        dateTimeLabel.text = "Loading"
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            guard let model = try? JSONDecoder().decode(UTCTimeModel.self, from: data) else {
                return
            }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
            
            guard let now = formatter.date(from: model.currentDateTime) else {
                return
            }
            
            self.currentDateTime = now
            
            DispatchQueue.main.async {
                self.updateDateTime()
            }
        }.resume()
    }
    
    private func updateDateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        dateTimeLabel.text = formatter.string(from: currentDateTime)
    }
    
    @IBAction func onYesterday(_ sender: UIButton) {
        guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: currentDateTime) else {
            return
        }
        currentDateTime = yesterday
        updateDateTime()
    }
    
    @IBAction func onNow(_ sender: UIButton) {
        fetchNow()
    }
    
    @IBAction func onTomorrow(_ sender: UIButton) {
        guard let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: currentDateTime) else {
            return
        }
        currentDateTime = tomorrow
        updateDateTime()
    }
}

struct UTCTimeModel: Decodable {
    let currentDateTime: String
}
