import UIKit

class BlueView: UIViewController {
    var viewModel: BlueViewModelProtocol?

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    @IBAction func buttonPressed(_ sender: Any) {
        viewModel?.showYellowView()
    }
}

// MARK: - View setup
extension BlueView {
    func setupView() {
        guard let viewModel = viewModel else {
            return
        }

        title = viewModel.title
        text.text = viewModel.text
        button.setTitle(viewModel.buttonTitle, for: .normal)

        view.backgroundColor = UIColor(
            red: CGFloat(viewModel.color.red),
            green: CGFloat(viewModel.color.green),
            blue: CGFloat(viewModel.color.blue),
            alpha: 255.0)
    }
}

// MARK: - Creating instances
extension BlueView {
    static func create() -> BlueView {
        return BlueView(nibName: "BlueView", bundle: Bundle.main)
    }
}
