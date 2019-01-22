import UIKit

class YellowView: UIViewController {
    var viewModel: YellowViewModelProtocol?

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var count: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

         setupView()
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        viewModel?.dismiss()
    }
}

// MARK: - View setup
extension YellowView {
    func setupView() {
        guard let viewModel = viewModel else {
            return
        }

        title = viewModel.title
        text.text = viewModel.text
        button.setTitle(viewModel.buttonTitle, for: .normal)
        count.text = "Count: \(viewModel.count)"

        view.backgroundColor = UIColor(
            red: CGFloat(viewModel.color.red),
            green: CGFloat(viewModel.color.green),
            blue: CGFloat(viewModel.color.blue),
            alpha: 255.0)
    }
}

// MARK: - YellowViewDelegate
extension YellowView: YellowViewDelegate {
    func countDidChange() {
        guard let viewModel = viewModel else {
            return
        }

        count.text = "Count: \(viewModel.count)"
    }
}

// MARK: - Creating instances
extension YellowView {
    static func create() -> YellowView {
        return YellowView(nibName: "YellowView", bundle: Bundle.main)
    }
}
