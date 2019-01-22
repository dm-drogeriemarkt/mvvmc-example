import UIKit

class GreenView: UIViewController {
    var viewModel: GreenViewModelProtocol?

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    @IBAction func buttonPressed(_ sender: Any) {
        viewModel?.showRedView(withParameter: textField.text ?? "")
    }
}

// MARK: - View setup
extension GreenView {
    func setupView() {
        guard let viewModel = viewModel else {
            return
        }

        title = viewModel.title
        text.text = viewModel.text
        button.setTitle(viewModel.buttonTitle, for: .normal)
        textField.text = viewModel.defaultText

        view.backgroundColor = UIColor(
            red: CGFloat(viewModel.color.red),
            green: CGFloat(viewModel.color.green),
            blue: CGFloat(viewModel.color.blue),
            alpha: 255.0)
    }
}

// MARK: - Creating instances
extension GreenView {
    static func create() -> GreenView {
        return GreenView(nibName: "GreenView", bundle: Bundle.main)
    }
}
