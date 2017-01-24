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

class DetailVC: UIViewController, GMSMapViewDelegate, showDetailDelegate, NavBarDelegate {
    
    var store = MuseumDataStore.sharedInstance
    var museum: Museum?
    var detailView: DetailView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.showDetailDelegate = self
        detailView.navDelegate = self
    }

    override func loadView(){
        guard let museum = self.museum else { return }
        self.detailView = DetailView(frame: CGRect.zero, museum: museum)
        self.view = self.detailView
    }
    
    func goToWebView() {
        let webViewController = WebVC()
        if let museum = museum {
            webViewController.museumURL = museum.url
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
    
    func goHome(){
        let homeViewController = MuseumListVC()
        navigationController?.pushViewController(homeViewController, animated: false)
    }
    
    func showMap(){
        let mapViewController = MapVC()
        navigationController?.pushViewController(mapViewController, animated: false)
    }

    func goToDetailView(){
        
    }
    
}
