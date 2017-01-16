//
//  WebVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/14/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class WebVC: UIViewController {
    
    var museumURL: String!
    var webView: WebView!
    
    @IBOutlet weak var museumWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = WebView(frame: CGRect.zero, museumURL: museumURL)
        self.view = self.webView
        setUpToolbar()

    }
    
    func setUpToolbar (){
        
        let backButton = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(goBack))
        let forwardButton = UIBarButtonItem(title: ">", style: .plain, target: self, action: #selector(goForward))
        let refreshButton = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(doRefresh))
        let stopButton = UIBarButtonItem(title: "X", style: .plain, target: self, action: #selector(stop))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let toolbarButtons: [UIBarButtonItem] = [backButton, spacer, forwardButton, spacer, refreshButton, spacer, stopButton]
        
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.toolbar.items = toolbarButtons
        self.navigationController?.toolbar.setItems(toolbarItems, animated: false)
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

    
    
    

}


