import UIKit
import ReactorKit
import Then
import SnapKit
import RxCocoa

final class ViewController: UIViewController {
    private let countLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .center
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
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countLabel)
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        view.addSubview(decreaseButton)
        decreaseButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.centerY.equalTo(countLabel)
            $0.trailing.equalTo(countLabel.snp.leading).offset(-50)
        }
        
        view.addSubview(increaseButton)
        increaseButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.centerY.equalTo(countLabel)
            $0.leading.equalTo(countLabel.snp.trailing).offset(50)
        }
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(50)
        }
    }
}

extension ViewController: View {
    func bind(reactor: CounterViewReactor) {
        // Input
        increaseButton.rx.tap
            .map { Reactor.Action.increase }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        decreaseButton.rx.tap
            .map { Reactor.Action.decrease }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // Label state
        reactor.state
            .map { $0.value }
            .distinctUntilChanged()
            .map { "\($0)"}
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
        
        // ActivityIndicator state
        reactor.state
            .map { $0.isLoading }
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}

