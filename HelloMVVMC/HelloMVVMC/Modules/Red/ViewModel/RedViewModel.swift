struct RedViewModel {
    let parameter: String

    var title = "Red"
    var color: (red: Float, green: Float, blue: Float) = (red: 255.0, green: 0.0, blue: 0.0)
    var text = "Press the button to go back"
    var buttonTitle = "Go back"

    weak var coordinatorDelegate: RedCoordinatorViewModelDelegate?

    init(withParameter parameter: String) {
        self.parameter = parameter
    }
}

// MARK: - RedViewModelProtocol
extension RedViewModel: RedViewModelProtocol {
    func dismiss() {
        coordinatorDelegate?.dismiss()
    }
}
