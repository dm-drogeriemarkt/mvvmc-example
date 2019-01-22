import UIKit

class BlueCoordinator {
    let navigationController: UINavigationController

    var childCoordinator: CoordinatorProtocol? = nil

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - CoordinatorProtocol
extension BlueCoordinator: CoordinatorProtocol {
    func start() {
        let blueView = BlueView.create()
        var viewModel = BlueViewModel()
        viewModel.coordinatorDelegate = self
        blueView.viewModel = viewModel
        navigationController.pushViewController(blueView, animated: false)
    }
}

// MARK: - YellowCoordinatorDelegate
extension BlueCoordinator: YellowCoordinatorDelegate {
    func requestDismissal() {
        navigationController.dismiss(animated: true)
        childCoordinator = nil
    }
}

// MARK: - BlueCoordinatorViewModelDelegate
extension BlueCoordinator: BlueCoordinatorViewModelDelegate {
    func navigateToYellow() {
        let yellowCoordinator = YellowCoordinator(viewController: navigationController)
        yellowCoordinator.coordinatorDelegate = self
        childCoordinator = yellowCoordinator
        yellowCoordinator.start()
    }
}
