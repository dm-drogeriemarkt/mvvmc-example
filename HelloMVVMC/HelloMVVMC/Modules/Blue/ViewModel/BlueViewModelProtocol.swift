protocol BlueViewModelProtocol {
    var title: String { get }
    var color: (red: Float, green: Float, blue: Float) { get }
    var text: String { get }
    var buttonTitle: String { get }
    var coordinatorDelegate: BlueCoordinatorViewModelDelegate? { get set }

    func showYellowView()
}
