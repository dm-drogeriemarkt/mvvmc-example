import UIKit

class YellowCoordinator {
    let viewController: UIViewController

    weak var coordinatorDelegate: YellowCoordinatorDelegate?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - CoordinatorProtocol
extension YellowCoordinator: CoordinatorProtocol {
    func start() {
        let yellowView = YellowView.create()
        let viewModel = YellowViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.viewDelegate = yellowView
        yellowView.viewModel = viewModel
        viewController.present(yellowView, animated: true)
    }
}

// MARK: - YellowCoordinatorViewModelDelegate
extension YellowCoordinator: YellowCoordinatorViewModelDelegate {
    func dismiss() {
        coordinatorDelegate?.requestDismissal()
    }
}
