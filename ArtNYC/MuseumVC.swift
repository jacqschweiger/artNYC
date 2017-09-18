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
    var searchVC: SearchVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if store.allMuseums.count == 0 {
            store.getMuseums {
                DispatchQueue.main.async {
                    self.museumView.museums = self.store.allMuseums
                    self.store.getHours {
                        self.museumView.museumCollectionView.reloadData()
                    }
                }
            }
        }
        
        self.museumView.searchController.searchResultsUpdater = self
        self.museumView.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        extendedLayoutIncludesOpaqueBars = true
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    

    override func loadView() {
        
        self.museumView = MuseumView()
        self.museumView.delegate = self
        
        self.view = self.museumView
        
        self.filterVC = FilterVC()
        self.filterVC.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if store.filteredMuseums.count > 0 {
            self.museumView.museums = store.filteredMuseums
        } else if store.filteredMuseums.count == 0 {
            self.museumView.museums = store.allMuseums
        }
        
    }
    
 
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        self.store.filteredMuseums = self.store.allMuseums.filter({( museum : Museum) -> Bool in

            return (museum.title?.lowercased().contains(searchText.lowercased()))!
        })
        self.museumView.museumCollectionView.reloadData()
    }
    
    
    
    func goToDetailView(){
        let detailViewController = DetailVC()
        detailViewController.museum = self.museumView.selectedMuseum
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func showFilter(){
        //filterVC.modalPresentationStyle = .overFullScreen
        //filterVC.modalTransitionStyle = .crossDissolve
        //self.present(filterVC, animated: true, completion: nil)
        searchVC = SearchVC()
        searchVC.modalPresentationStyle = .overFullScreen
        //searchVC.modalTransitionStyle = .crossDissolve
        self.present(searchVC, animated: true, completion: nil)
    }
    
    func refreshMuseums(){
//        if store.filteredMuseums.count > 0 {
//            self.museumView.museums = store.filteredMuseums
//        } else if store.filteredMuseums.count == 0 {
//            self.museumView.museums = store.allMuseums
//        }
//        self.museumView.museumCollectionView.reloadData()
    }
    
    
    
}

extension MuseumVC: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(self.museumView.searchController.searchBar.text!)
    }
}
