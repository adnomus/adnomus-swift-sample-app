//
//  ViewController
//  AdNomusTest
//
//  Created by Giuseppe Barbalinardo on 1/23/17.
//  Copyright © 2017 Giuseppe Barbalinardo. All rights reserved.
//

import UIKit
import JavaScriptCore
import WebKit
import AdnomusSdk

class StandardAdViewController: UIViewController, AdNomusContextDelegate {
    
    @IBOutlet weak var contentText: UITextField!
    @IBOutlet weak var contextIdView: UITextView!
    @IBOutlet weak var contextIdText: UITextField!
    @IBOutlet weak var contentUrlText: UITextField!
    @IBOutlet weak var adViewContainer: UIView!
    
    var adSize = AdNomusConstants.AdSize.s728x90
    
    @IBAction func getNormalAdWithContent(_ sender: Any) {
        let frame = self.adViewContainer.frame
        let adManager = AdNomusControl.sharedInstance
        let webView = adManager.standardWebView(content: self.contentText.text!, frame: frame, adSize: self.adSize, adKind: AdNomusConstants.AdKind.standard)
        self.view.addSubview(webView)
    }
    
    @IBAction func getContextForContent(_ sender: Any) {
        let adManager = AdNomusControl.sharedInstance
        adManager.adContext(content: self.contentText.text!, contextDelegate: self)
        
    }
    
    @IBAction func getNormalAdWithContext(_ sender: Any) {
        let frame = self.adViewContainer.frame
        let adManager = AdNomusControl.sharedInstance
        let webView = adManager.standardWebView(context: self.contextIdText.text!, frame:  frame, adSize: AdNomusConstants.AdSize.s728x90, adKind: AdNomusConstants.AdKind.standard)
        self.view.addSubview(webView)
    }
    
    @IBAction func getNormalAdWithContentURL(_ sender: Any) {
        let frame = self.adViewContainer.frame
        let url = URL(string: self.contentUrlText.text!)
        let adManager = AdNomusControl.sharedInstance
        let webView = adManager.standardWebView(contentURL: url!, frame:  frame, adSize: AdNomusConstants.AdSize.s728x90, adKind: AdNomusConstants.AdKind.standard)
        self.view.addSubview(webView)
        
    }
    
    func didReceiveResponse(context: AdNomusContextObject) {
        self.contextIdView.text = context.contextId
    }

    @IBAction func adSizeDidChange(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.adSize = AdNomusConstants.AdSize.s120x20
            break
        case 1:
            self.adSize = AdNomusConstants.AdSize.s168x28
            break
        case 2:
            self.adSize = AdNomusConstants.AdSize.s216x36
            break
        case 3:
            self.adSize = AdNomusConstants.AdSize.s300x50
            break
        case 4:
            self.adSize = AdNomusConstants.AdSize.s320x50
            break
        case 5:
            self.adSize = AdNomusConstants.AdSize.s728x90
            break
        case 6:
            self.adSize = AdNomusConstants.AdSize.s120x600
            break
        case 7:
            self.adSize = AdNomusConstants.AdSize.s300x50
            break
        default:
            self.adSize = AdNomusConstants.AdSize.s728x90
        }
    }
}

