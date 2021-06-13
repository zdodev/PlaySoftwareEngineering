import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.dateTimeLabel.text = self?.viewModel.dateTimeString
            }
        }
        viewModel.reload()
    }
    
    @IBAction func onYesterday(_ sender: UIButton) {
        viewModel.moveDay(day: -1)
    }
    
    @IBAction func onNow(_ sender: UIButton) {
        viewModel.reload()
    }
    
    @IBAction func onTomorrow(_ sender: UIButton) {
        viewModel.moveDay(day: 1)
    }
}
