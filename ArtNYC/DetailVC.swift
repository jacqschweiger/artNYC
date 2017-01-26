//
//  DetailVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class DetailVC: UIViewController, GMSMapViewDelegate, ShowInfoDelegate, BackDelegate {
    
    var store = MuseumDataStore.sharedInstance
    var museum: Museum!
    var museumURL: String?
    var detailView: DetailView!
    var placeID: String!
    var photoReference: String!
    var photoURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.showInfoDelegate = self
        detailView.backDelegate = self
    }
    
    override func loadView(){

        self.detailView = DetailView(frame: CGRect.zero, museum: museum)
        self.view = self.detailView
        detailView.reloadInputViews()
    
    }
    
    // MARK: Button Functions
    
    func goToWebView() {
        let webViewController = WebVC()
        if let museum = museum {
            webViewController.museum = museum
        }
        navigationController?.pushViewController(webViewController, animated: true)
    }
    
    func goToInteriorView() {
        let interiorViewController = InteriorVC()
        if let museum = museum {
            interiorViewController.museum = museum
        }
        navigationController?.pushViewController(interiorViewController, animated: true)
    }
    
    func goBack(){
        _ = self.navigationController?.popViewController(animated: true)
    }
}
