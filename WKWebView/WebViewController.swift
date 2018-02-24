import Cocoa
import WebKit
class WebViewController: NSViewController, WKUIDelegate, WKNavigationDelegate {
    var delegate: feedBack?
    var myWebView: WKWebView!
    func output(item: AnyObject) {
    }
    func webView(_ myWebView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    func webView(_ myWebView: WKWebView, didCommit navigation: WKNavigation!) {
    }
    func webView(_ myWebView: WKWebView, didFinish navigation: WKNavigation!) {
    }
    func webViewWebContentProcessDidTerminate(_ myWebView: WKWebView) {
    }
    func webView(_ myWebView: WKWebView, didFail navigation: WKNavigation!, withError: Error) {
    }
    func webView(_ myWebView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError: Error) {
    }
    func webView(_ myWebView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
    }
    func webView(_ myWebView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            let newLink = navigationAction.request
            openSafari(link: newLink.url!)
        }
        return nil
    }
    func openSafari(link: URL) {
        let checkURL = link
        if NSWorkspace.shared.open(checkURL as URL) {
        } else {
        }
    }
    func react() {
        if let doAction = delegate {
            DispatchQueue.main.async() { 
                doAction.output()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = WKWebViewConfiguration()
        myWebView = WKWebView(frame: .zero, configuration: configuration)
        myWebView.translatesAutoresizingMaskIntoConstraints = false
        myWebView.navigationDelegate = self
        myWebView.uiDelegate = self
        view.addSubview(myWebView)
        [myWebView.topAnchor.constraint(equalTo: view.topAnchor),
         myWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         myWebView.leftAnchor.constraint(equalTo: view.leftAnchor),
         myWebView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach  { 
            anchor in
            anchor.isActive = true
        }
        // let myURL = URL(string: "http://localhost:8123")
        let myURL = URL(string: "http://crunkweb.wicp.net")  //Change Home Assistant address here
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
    }
}
