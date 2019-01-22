import UIKit

class RedView: UIViewController {
    var viewModel: RedViewModelProtocol?

    @IBOutlet weak var parameter: UILabel!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var button: UIButton!

    @IBAction func buttonPressed(_ sender: Any) {
        viewModel?.dismiss()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

// MARK: - View setup
extension RedView {
    func setupView() {
        guard let viewModel = viewModel else {
            return
        }

        title = viewModel.title
        parameter.text = viewModel.parameter
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
extension RedView {
    static func create() -> RedView {
        return RedView(nibName: "RedView", bundle: Bundle.main)
    }
}
