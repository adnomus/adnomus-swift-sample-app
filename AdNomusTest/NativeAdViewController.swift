//
//  NativeViewController.swift
//  AdNomusTest
//
//  Created by Giuseppe Barbalinardo on 1/31/17.
//  Copyright © 2017 Giuseppe Barbalinardo. All rights reserved.
//

import UIKit
import WebKit
import AdnomusSdk


class NativeAdViewController: UIViewController, AdNomusNativeDelegate, AdNomusContextDelegate {
    
    @IBOutlet weak var textResponse: UITextView!
    @IBOutlet weak var contentText: UITextField!
    @IBOutlet weak var contextIdView: UITextView!
    @IBOutlet weak var contextIdText: UITextField!
    @IBOutlet weak var contentUrlText: UITextField!
    var adSize = AdNomusConstants.AdSize.s320x50
    var nativeObject : AdNomusNativeObject?

    @IBAction func getNativeAdWithContent(_ sender: Any) {
        self.textResponse.text = ""

        let adManager = AdNomusControl.sharedInstance
        let _ = adManager.nativeAd(content: self.contentText.text!, adSize: self.adSize, adKind: AdNomusConstants.AdKind.native, nativeDelegate: self)
    }
    
    
    @IBAction func getContextForContent(_ sender: Any) {
        self.textResponse.text = ""
        let adManager = AdNomusControl.sharedInstance
        adManager.adContext(content: self.contentText.text!, contextDelegate: self)
        
    }
    
    @IBAction func getNativeAdWithContext(_ sender: Any) {
        self.textResponse.text = ""
        let adManager = AdNomusControl.sharedInstance
        let _ = adManager.nativeAd(context: self.contextIdText.text!, adSize: AdNomusConstants.AdSize.s320x50, adKind: AdNomusConstants.AdKind.native, nativeDelegate: self)
    }

    @IBAction func getNativeAdWithContentURL(_ sender: Any) {
        self.textResponse.text = ""
        let adManager = AdNomusControl.sharedInstance
        let url = URL(string: self.contentUrlText.text!)
        let _ = adManager.nativeAd(contentURL: url!, adSize: AdNomusConstants.AdSize.s320x50, adKind: AdNomusConstants.AdKind.native, nativeDelegate: self)
    }

    // Native response delegate
    func didReceiveResponse(nativeObject: AdNomusNativeObject) {
        self.nativeObject = nativeObject
        self.textResponse.text = String(describing: self.nativeObject)
    }
    
    // Context response delegate
    func didReceiveResponse(context: AdNomusContextObject) {
        self.contextIdView.text = context.contextId
    }
    
    // Ad shown / clicked
    @IBAction func reportAdShown(_ sender: Any) {
        self.nativeObject?.reportAdShown()
    }
    
    @IBAction func reportAdClicked(_ sender: Any) {
        self.nativeObject?.reportAdClicked()
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
