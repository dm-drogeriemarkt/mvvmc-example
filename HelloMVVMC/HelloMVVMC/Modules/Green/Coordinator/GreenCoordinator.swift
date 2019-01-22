import UIKit

class GreenCoordinator {
    let navigationController: UINavigationController

    var childCoordinator: CoordinatorProtocol? = nil

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - CoordinatorProtocol
extension GreenCoordinator: CoordinatorProtocol {
    func start() {
        let greenView = GreenView.create()
        var viewModel = GreenViewModel()
        viewModel.coordinatorDelegate = self
        greenView.viewModel = viewModel
        navigationController.pushViewController(greenView, animated: false)
    }
}

// MARK: - RedCoordinatorDelegate
extension GreenCoordinator: RedCoordinatorDelegate {
    func requestDismissal() {
        navigationController.popViewController(animated: true)
        childCoordinator = nil
    }
}

// MARK: - GreenCoordinatorViewModelDelegate
extension GreenCoordinator: GreenCoordinatorViewModelDelegate {
    func navigateToRed(withParameter parameter: String) {
        let redCoordinator = RedCoordinator(navigationController: navigationController, parameter: parameter)
        redCoordinator.coordinatorDelegate = self
        childCoordinator = redCoordinator
        redCoordinator.start()
    }
}
