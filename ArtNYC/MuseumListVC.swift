//
//  MuseumListVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/14/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import NotificationCenter

class MuseumListVC: UIViewController, NavBarDelegate {

    weak var delegate: NavBarDelegate?
    let museumListView = MuseumListView()
    var store = MuseumDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.loadMuseums()
        museumListView.delegate = self
        
        self.reloadInputViews()
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func loadView() {
        self.view = museumListView
    }
    
    func setFilterIcon(){
        let filterButton = UIButton()
        filterButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        filterButton.setImage(UIImage(named: "Filter-50"), for: .normal)
        filterButton.addTarget(self, action: #selector(sortAZ), for: .touchUpInside)
        
        let filterBarButton = UIBarButtonItem()
        filterBarButton.customView = filterButton
        
        self.navigationItem.rightBarButtonItem = filterBarButton
    }
    
    func goToDetailView(){
        let detailViewController = DetailVC()
        detailViewController.museum = self.museumListView.selectedMuseum
        navigationController?.pushViewController(detailViewController, animated: false)
    }
    
    // MARK: Toolbar Functions
    
    func goHome(){
        self.reloadInputViews()
    }
    
    func showMap(){
        let mapViewController = MapVC()
        navigationController?.pushViewController(mapViewController, animated: false)
    }
    
    func sortAZ(){
        print("sort pressed")
        store.museums.sort { (museum1, museum2) -> Bool in
            return museum1.title! < museum2.title!
        }
        DispatchQueue.main.async {
            self.museumListView.tableView.reloadData()
        }
    }
}
