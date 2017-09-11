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
    var filterVC: FilterVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.store.loadMuseums {
            OperationQueue.main.addOperation {
                self.reloadInputViews()
                self.museumView.museumCollectionView.reloadData()
            }
        }
        
    }
    
    override func loadView() {
        self.museumView = MuseumView()
        self.museumView.delegate = self
        
        self.view = self.museumView
        
        self.filterVC = FilterVC()
        self.filterVC.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
        if store.filteredMuseums.count > 0 {
            self.museumView.museums = store.filteredMuseums
        } else if store.filteredMuseums.count == 0 {
            self.museumView.museums = store.allMuseums
        }
        
        print("** view will appear")
    }
    
    func goToDetailView(){
        let detailViewController = DetailVC()
        detailViewController.museum = self.museumView.selectedMuseum
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
