//
//  WebVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/14/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class WebVC: UIViewController, WebNavDelegate, BackDelegate {
    
    var museum: Museum!
    var webView: WebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = WebView(frame: CGRect.zero, museum: museum)
        self.view = self.webView
        webView.delegate = self
        webView.backDelegate = self
    }
    
    func goBack(){
        _ = self.navigationController?.popViewController(animated: false)
    }
    
    // MARK: WebView Navigation Functions

    func doGoBack(_: AnyObject) {
        webView.museumWebView.goBack()
    }
    
    func goForward(_: AnyObject) {
        webView.museumWebView.goForward()
    }
    
    func stop(_: AnyObject) {
        webView.museumWebView.stopLoading()
    }
    
    func doRefresh(_: AnyObject) {
        webView.museumWebView.reload()
    }
    
}


