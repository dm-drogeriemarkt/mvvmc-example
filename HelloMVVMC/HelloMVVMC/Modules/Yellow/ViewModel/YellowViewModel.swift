import Foundation

class YellowViewModel {
    var title = "Blue"
    var color: (red: Float, green: Float, blue: Float) = (red: 255.0, green: 255.0, blue: 0.0)
    var text = "Press the button to dismiss this view"
    var buttonTitle = "Dismiss"
    var timer = Timer()
    var count = 0
    weak var viewDelegate: YellowViewDelegate?

    weak var coordinatorDelegate: YellowCoordinatorViewModelDelegate?

    init() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(YellowViewModel.updateCounter)), userInfo: nil, repeats: true)
    }
}

// MARK: - YellowViewModelProtocol
extension YellowViewModel: YellowViewModelProtocol {
    func dismiss() {
        timer.invalidate()
        coordinatorDelegate?.dismiss()
    }
}

// MARK: - Timer
extension YellowViewModel {
    @objc func updateCounter() {
        count += 1
        viewDelegate?.countDidChange()
    }
}
