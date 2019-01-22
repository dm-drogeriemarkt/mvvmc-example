import UIKit

class AppCoordinator: CoordinatorProtocol {
    let window: UIWindow

    // We have to store the references to the coordinators to prevent them from beeing deinitialized
    var coordinators: [CoordinatorProtocol] = []

    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - CoordinatorProtocol
extension AppCoordinator {
    func start() {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.viewControllers = []

        let blueTab = createNavigationController(withTitle: "Blue")
        let greenTab = createNavigationController(withTitle: "Green")

        let blueCoordinator = BlueCoordinator(navigationController: blueTab)
        coordinators.append(blueCoordinator)
        blueCoordinator.start()

        let greenCoordinator = GreenCoordinator(navigationController: greenTab)
        coordinators.append(greenCoordinator)
        greenCoordinator.start()

        let rootViewControllers = [blueTab, greenTab]
        tabBarController.setViewControllers(rootViewControllers, animated: false)

        window.rootViewController = tabBarController
    }
}

// MARK: - Creating tabs
extension AppCoordinator {
    func createNavigationController(withTitle title: String) -> UINavigationController {
        let navController = UINavigationController()
        navController.navigationBar.isTranslucent = false

        if #available(iOS 11.0, *) {
            navController.navigationBar.prefersLargeTitles = true
        }

        navController.tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        return navController
    }
}
