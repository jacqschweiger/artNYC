//
//  WebVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/14/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class WebVC: UIViewController, WebViewDelegate {
    
    var museumURL: String!
    var webView: WebView!
    var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = WebView(frame: CGRect.zero, museumURL: museumURL)
        self.view = self.webView
        webView.delegate = self
        createBackButton()
    }

    func goBack(_: AnyObject) {
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
    
    func createBackButton(){
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "BackNav"), for: .normal)
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: #selector(WebVC.backAction), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
    }
    
    func backAction() -> Void {
        self.navigationController?.popViewController(animated: true)
    }

    
    
    

}


