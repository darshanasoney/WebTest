//
//  ViewController.swift
//  WebTest
//
//  Created by home on 04/11/23.
//

import UIKit
import SafariServices


internal let webUrl = "https://www.apple.com/"
internal let safariUrl = "https://www.apple.com/in/safari/"
internal let defautltUrl = "https://www.google.com/"


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Started...")
    }

    @IBAction func internalWebClicked(_ sender : Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "InternalWebController") as? InternalWebController {
            vc.webUrl = webUrl
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
    @IBAction func safariWebClicked(_ sender : Any) {
        if let url = URL(string: safariUrl) {
            let svc = SFSafariViewController(url: url)
            svc.delegate = self
            present(svc, animated: true, completion: nil)
        }
    }
    
    @IBAction func defaultBrowserClicked(_ sender : Any) {
        if let url = URL(string: defautltUrl), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

extension ViewController : SFSafariViewControllerDelegate {
    
//    func safariViewController(_ controller: SFSafariViewController, activityItemsFor URL: URL, title: String?) -> [UIActivity] {
//        return []
//    }
//
//    func safariViewController(_ controller: SFSafariViewController, excludedActivityTypesFor URL: URL, title: String?) -> [UIActivity.ActivityType] {
//        return [.print]
//    }
  
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("load finished")
    }
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("loaded successfully!")
    }

    func safariViewController(_ controller: SFSafariViewController, initialLoadDidRedirectTo URL: URL) {
        print("initialLoadDidRedirectTo!")
    }

    @available(iOS 14.0, *)
    func safariViewControllerWillOpenInBrowser(_ controller: SFSafariViewController) {
        print("safariViewControllerWillOpenInBrowser!")
    }
}
