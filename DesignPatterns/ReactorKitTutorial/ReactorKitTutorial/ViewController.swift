import UIKit
import ReactorKit
import RxCocoa

final class ViewController: UIViewController, StoryboardView {
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var disposeBag = DisposeBag()
    
    func bind(reactor: CounterViewReactor) {
        plusButton.rx.tap
            .map { Reactor.Action.increase }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state
            .map { $0.value }
            .distinctUntilChanged()
            .map { "\($0) " }
            .bind(to: numberLabel.rx.text )
            .disposed(by: disposeBag)
    }
}

