protocol GreenViewModelProtocol {
    var title: String { get }
    var color: (red: Float, green: Float, blue: Float) { get }
    var text: String { get }
    var buttonTitle: String { get }
    var defaultText: String { get }
    var coordinatorDelegate: GreenCoordinatorViewModelDelegate? { get set }

    func showRedView(withParameter parameter: String)
}
