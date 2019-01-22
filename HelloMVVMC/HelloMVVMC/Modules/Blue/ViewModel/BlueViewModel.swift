struct BlueViewModel {
    var title = "Blue"
    var color: (red: Float, green: Float, blue: Float) = (red: 0.0, green: 0.0, blue: 255.0)
    var text = "Press the button to trigger a modal view"
    var buttonTitle = "Trigger"

    weak var coordinatorDelegate: BlueCoordinatorViewModelDelegate?
}

// MARK: - BlueViewModelProtocol
extension BlueViewModel: BlueViewModelProtocol {
    func showYellowView() {
        coordinatorDelegate?.navigateToYellow()
    }
}
