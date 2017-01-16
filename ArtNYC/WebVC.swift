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
    var toolbar: UIToolbar!
    
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
        
        for button in toolbarButtons {
            button.tintColor = UIColor(named: UIColor.ColorName.turquoise)
        }
        
        toolbar = UIToolbar()
        self.view.addSubview(toolbar)
        self.toolbar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.toolbar.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.toolbar.translatesAutoresizingMaskIntoConstraints = false
        self.toolbar.setItems(toolbarButtons, animated: false)
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


