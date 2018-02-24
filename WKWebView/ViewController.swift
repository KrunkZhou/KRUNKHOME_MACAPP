import Cocoa
class ViewController: NSViewController, feedBack {
    let webViewController = WebViewController()
    @objc func output() {
    }
    @IBOutlet var myTextView: NSTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        output()
        webViewController.delegate = self
        webViewController.react()
    }
    override var representedObject: Any? {
        didSet {
        }
    }
}
