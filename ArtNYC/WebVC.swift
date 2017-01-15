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
    
    @IBAction func doRefresh(_: AnyObject) {
        museumWebView.reload()
    }
    
    @IBAction func goBack(_: AnyObject) {
        museumWebView.goBack()
    }
    
    @IBAction func goForward(_: AnyObject) {
        museumWebView.goForward()
    }
    
    @IBAction func stop(_: AnyObject) {
        museumWebView.stopLoading()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = WebView(frame: CGRect.zero, museumURL: museumURL)
        self.view = self.webView
        
//        DispatchQueue.main.async {
//            let url = NSURL(string: self.museumURL)
//            let request = NSURLRequest(url: url as! URL)
//            self.museumWebView.loadRequest(request as URLRequest)
//        }
        
        self.reloadInputViews()
    }
    

}


