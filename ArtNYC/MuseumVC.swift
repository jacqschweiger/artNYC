//
//  MuseumVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 2/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import GooglePlaces

class MuseumVC: UIViewController, MuseumViewDelegate, FilterVCDelegate {
    
    var store = MuseumDataStore.sharedInstance
    var museumView: MuseumView!
    var museumTableViewCell: MuseumTableViewCell!
    var museumTableView: MuseumTableView!
    var filterVC: FilterVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
//        self.museumView = MuseumView()
//        self.museumView.delegate = self
        
        self.museumTableViewCell = MuseumTableViewCell()
        self.museumTableViewCell.delegate = self
        
        self.museumTableView = MuseumTableView()
        
        //self.view = self.museumView
        self.view = self.museumTableView
        
        self.filterVC = FilterVC()
        self.filterVC.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
        if store.filteredMuseums.count > 0 {
            self.museumTableView.museums = store.filteredMuseums
        } else if store.filteredMuseums.count == 0 {
            self.museumTableView.museums = store.allMuseums
        }
    }
    
    func goToDetailView(){
        print("go to detail view called")
        let detailViewController = DetailVC()
        //detailViewController.museum = self.museumView.selectedMuseum
        detailViewController.museum = self.museumTableViewCell.selectedMuseum
        print("category row selected = \(self.museumTableViewCell.selectedMuseum)")
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func showFilter(){
        filterVC.modalPresentationStyle = .overFullScreen
        filterVC.modalTransitionStyle = .crossDissolve
        self.present(filterVC, animated: true, completion: nil)
    }
    
    func refreshMuseums(){
        if store.filteredMuseums.count > 0 {
            self.museumView.museums = store.filteredMuseums
        } else if store.filteredMuseums.count == 0 {
            self.museumView.museums = store.allMuseums
        }
        self.museumView.museumCollectionView.reloadData()
    }
    
}
