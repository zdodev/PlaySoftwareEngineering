import UIKit

final class MainViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    private let firstButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("first Controller", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(nil, action: #selector(tappedFirstButton), for: .touchUpInside)
        return button
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("second Controller", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(nil, action: #selector(tappedSecondButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 100),
        ])
    }
    
    @objc func tappedFirstButton() {
        coordinator?.presentFirstViewController()
    }
    
    @objc func tappedSecondButton() {
        coordinator?.presentSecondViewController()
    }
}

