import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    private let countLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .center
        $0.text = "0"
    }
    
    private let decreaseButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentHorizontalAlignment = .fill
        $0.contentVerticalAlignment = .fill
        $0.setImage(.init(systemName: "minus.circle.fill"), for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    private let increaseButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentHorizontalAlignment = .fill
        $0.contentVerticalAlignment = .fill
        $0.setImage(.init(systemName: "plus.circle.fill"), for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    private let activityIndicatorView = UIActivityIndicatorView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addUI()
        setupUIConstraints()
        configureViews()
    }
    
    private func addUI() {
        view.addSubview(countLabel)
        view.addSubview(decreaseButton)
        view.addSubview(increaseButton)
        view.addSubview(activityIndicatorView)
    }
    
    private func setupUIConstraints() {
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        decreaseButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.centerY.equalTo(countLabel)
            $0.trailing.equalTo(countLabel.snp.leading).offset(-50)
        }
        
        increaseButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.centerY.equalTo(countLabel)
            $0.leading.equalTo(countLabel.snp.trailing).offset(50)
        }
        
        activityIndicatorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(50)
        }
    }
    
    private func configureViews() {
        increaseButton.addTarget(nil, action: #selector(tappedIncreaseButton), for: .touchUpInside)
        decreaseButton.addTarget(nil, action: #selector(tappedDecreaseButton), for: .touchUpInside)
    }
    
    @objc private func tappedIncreaseButton() {
        activityIndicatorView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            count += 1
            countLabel.text = "\(count)"
            activityIndicatorView.stopAnimating()
        }
    }
    
    @objc private func tappedDecreaseButton() {
        activityIndicatorView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            count -= 1
            countLabel.text = "\(count)"
            activityIndicatorView.stopAnimating()
        }
    }
}

