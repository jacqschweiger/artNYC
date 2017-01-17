//
//  MuseumListView.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/17/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

protocol MuseumListDelegate: class {
    func goToDetailView()
    func showMap()
    func sortAZ()
    func sortZA()
}

class MuseumListView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: MuseumListDelegate?
    let tableView = UITableView()
    let toolbar = UIToolbar()
    var store = MuseumDataStore.sharedInstance
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.addSubview(tableView)
        setUpToolbar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.museums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as! MuseumTableViewCell
        cell.museumNameLabel.text = store.museums[indexPath.row].title
        cell.museumLogo.image = store.museums[indexPath.row].logo
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func setUpToolbar (){
        
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(sortAZ))
        let mapButton = UIBarButtonItem(title: "Map", style: .plain, target: self, action: #selector(showMap))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let toolbarButtons: [UIBarButtonItem] = [filterButton, spacer, mapButton]
        
        for button in toolbarButtons {
            button.tintColor = UIColor(named: UIColor.ColorName.turquoise)
        }
        
        self.addSubview(toolbar)
        self.toolbar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.toolbar.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.toolbar.translatesAutoresizingMaskIntoConstraints = false
        self.toolbar.setItems(toolbarButtons, animated: false)
    }
    
    func showMap() {
        self.delegate?.showMap()
    }
    
    func sortAZ(){
        self.delegate?.sortAZ()
    }
    


    
    
}
