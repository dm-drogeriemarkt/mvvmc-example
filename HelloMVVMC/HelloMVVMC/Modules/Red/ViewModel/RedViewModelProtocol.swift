protocol RedViewModelProtocol {
    var parameter: String { get }
    var title: String { get }
    var color: (red: Float, green: Float, blue: Float) { get }
    var text: String { get }
    var buttonTitle: String { get }

    func dismiss()
}
