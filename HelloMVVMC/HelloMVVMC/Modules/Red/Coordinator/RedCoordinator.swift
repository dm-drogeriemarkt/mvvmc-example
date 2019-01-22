import UIKit

class RedCoordinator {
    let navigationController: UINavigationController
    let parameter: String

    weak var coordinatorDelegate: RedCoordinatorDelegate?

    init(navigationController: UINavigationController, parameter: String) {
        self.navigationController = navigationController
        self.parameter = parameter
    }
}

// MARK: - CoordinatorProtocol
extension RedCoordinator: CoordinatorProtocol {
    func start() {
        let redView = RedView.create()
        var viewModel = RedViewModel(withParameter: parameter)
        viewModel.coordinatorDelegate = self
        redView.viewModel = viewModel
        navigationController.pushViewController(redView, animated: true)
    }
}

// MARK: - RedCoordinatorViewModelDelegate
extension RedCoordinator: RedCoordinatorViewModelDelegate {
    func dismiss() {
        coordinatorDelegate?.requestDismissal()
    }
}
