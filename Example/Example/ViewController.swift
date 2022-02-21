import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var IncreaseButton: UIButton!
    
    private var viewModel = ViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        bind()
    }
    
    private func configureViews() {
    }
    
    private func bind() {
        viewModel.$count.sink { [weak self] value in
            self?.numberLabel.text = String(value)
        }.store(in: &cancellables)
    }
    
    @IBAction func tappedDecreaseButton(_ sender: UIButton) {
        viewModel.decreaseCount()
    }
    
    @IBAction func tappedIncreaseButton(_ sender: UIButton) {
        viewModel.increaseCount()
    }
}

