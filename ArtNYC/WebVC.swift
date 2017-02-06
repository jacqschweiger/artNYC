//
//  WebVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/14/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class WebVC: UIViewController, WebViewDelegate, BackDelegate, UIWebViewDelegate {
    
    var museum: Museum!
    var myWebView: MyWebView!
    var webViewer: UIWebView!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myWebView = MyWebView(frame: CGRect.zero, museum: museum)
        self.view = self.myWebView
        myWebView.delegate = self
        myWebView.backDelegate = self
        
        webViewer = myWebView.museumWebView
        webViewer.delegate = self
    }
    
    func goBack(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: WebView Navigation Functions
    
    func doGoBack(_: AnyObject) {
        myWebView.museumWebView.goBack()
    }
    
    func goForward(_: AnyObject) {
        myWebView.museumWebView.goForward()
    }
    
    func doRefresh(_: AnyObject) {
        myWebView.museumWebView.reload()
    }
    
    func openInBrowser(_: AnyObject) {
        let urlString = myWebView.museum.url
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)

    }
    
    
    // MARK: Activity Indicator Functions
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        myWebView.activityView.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myWebView.activityView.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        myWebView.activityView.stopAnimating()
    }



    
}


