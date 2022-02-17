import UIKit
import Combine

class ViewController: UIViewController {
    private let decreaseButton = UIButton(frame: .zero)
    private let increaseButton = UIButton(frame: .zero)
    private let label = UILabel(frame: .zero)
    private var viewModel = ViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        bind()
    }
    
    private func configureViews() {
        view.addSubview(decreaseButton)
        view.addSubview(increaseButton)
        view.addSubview(label)
        
        decreaseButton.translatesAutoresizingMaskIntoConstraints = false
        decreaseButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        decreaseButton.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -20).isActive = true
        
        decreaseButton.setTitle("decrease", for: .normal)
        decreaseButton.setTitleColor(.black, for: .normal)
        decreaseButton.backgroundColor = .lightGray
        decreaseButton.addTarget(nil, action: #selector(tappedDecreaseButton), for: .touchUpInside)
        
        increaseButton.translatesAutoresizingMaskIntoConstraints = false
        increaseButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        increaseButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20).isActive = true
        
        increaseButton.setTitle("increase", for: .normal)
        increaseButton.setTitleColor(.black, for: .normal)
        increaseButton.backgroundColor = .lightGray
        increaseButton.addTarget(nil, action: #selector(tappedIncreaseButton), for: .touchUpInside)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.text = "label"
        label.textAlignment = .center
    }
    
    private func bind() {
        viewModel.$count.sink { [weak self] value in
            self?.label.text = String(value)
        }.store(in: &cancellables)
    }
    
    @objc func tappedIncreaseButton() {
        viewModel.increaseCount()
    }
    
    @objc func tappedDecreaseButton() {
        viewModel.decreaseCount()
    }
}

