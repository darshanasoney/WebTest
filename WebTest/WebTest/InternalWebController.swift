//
//  InternalWebController.swift
//  WebTest
//
//  Created by home on 05/11/23.
//

import UIKit
import WebKit

class InternalWebController: UIViewController {

    @IBOutlet weak var webView : WKWebView!
    
    internal var webUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.webView.navigationDelegate = self
        self.webView.uiDelegate = self
        
        if let url = URL(string: webUrl) {
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
    
    @IBAction func dismissClicked(_ sender : Any) {
        if webView.canGoBack {
            webView.goBack()
        } else {
            self.dismiss(animated: true)
        }
    }

}

extension InternalWebController : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
    }

    @available(iOS 13.0, *)
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences) async -> (WKNavigationActionPolicy, WKWebpagePreferences){
        return (WKNavigationActionPolicy.allow, WKWebpagePreferences())
    }

    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse) async -> WKNavigationResponsePolicy {
        return .allow
    }

    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation...")
    }

    
    @available(iOS 8.0, *)
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("didReceiveServerRedirectForProvisionalNavigation...")
    }

    
    @available(iOS 8.0, *)
     func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
         print("didFailProvisionalNavigation...")
     }

    
    @available(iOS 8.0, *)
     func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
         print("didCommit...")
     }


    @available(iOS 8.0, *)
     func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         print("didFinish")
     }

   
    @available(iOS 8.0, *)
     func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
         print("didFail")
     }

    
    @available(iOS 9.0, *)
     func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
         print("webViewWebContentProcessDidTerminate")
     }

   
    @available(iOS 14.0, *)
     func webView(_ webView: WKWebView, shouldAllowDeprecatedTLSFor challenge: URLAuthenticationChallenge) async -> Bool {
         return true
     }

    
    @available(iOS 14.5, *)
     func webView(_ webView: WKWebView, navigationAction: WKNavigationAction, didBecome download: WKDownload){
         print("navigationAction didBecome")
     }

    @available(iOS 14.5, *)
    func webView(_ webView: WKWebView, navigationResponse: WKNavigationResponse, didBecome download: WKDownload) {
        print("navigationResponse didBecome")
    }
}

extension InternalWebController: WKUIDelegate {
    
    /*
     
     Other more javascript and data releated methods are available in this protocol
     
     */
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
    }
}
