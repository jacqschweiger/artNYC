//
//  SearchVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 9/18/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class SearchVC: UIViewController, FilterViewDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    let searchBar = UISearchBar()
    weak var delegate: FilterViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
        
        
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        extendedLayoutIncludesOpaqueBars = true
        self.view.addSubview(searchController.searchBar)
        
        

    }
    
    func createDismissButton(){
        let dismissButton = UIButton(type: .system)
        self.view.insertSubview(dismissButton, belowSubview: searchBar)
        self.view.sendSubview(toBack: dismissButton)
        
        dismissButton.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        dismissButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        dismissButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        dismissButton.backgroundColor = UIColor.clear
    }
    
    func dismissView(){
        self.delegate?.dismissView()
    }
    
    func filterMuseums(){
        //delete this
    }

    
    
}

extension SearchVC: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}
