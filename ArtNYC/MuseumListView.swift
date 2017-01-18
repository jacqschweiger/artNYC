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
}

class MuseumListView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: MuseumListDelegate?
    let tableView = UITableView()
    let toolbar = UIToolbar()
    var store = MuseumDataStore.sharedInstance
    var selectedMuseum: Museum!
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setUpTableView()
        setUpToolbar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.museums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MuseumTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "basicCell")
        cell.museumNameLabel.text = store.museums[indexPath.row].title
        cell.museumLogo.image = store.museums[indexPath.row].logo
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedMuseum = store.museums[indexPath.row]
        self.delegate?.goToDetailView()
    }
    
    func setUpTableView(){
        self.addSubview(tableView)
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.tableView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpToolbar (){
        
        let homeButton = UIButton()
        homeButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        homeButton.setImage(UIImage(named: "Home-50"), for: .normal)
        homeButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        
        let homeBarButton = UIBarButtonItem()
        homeBarButton.customView = homeButton
        
        let mapButton = UIButton()
        mapButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        mapButton.setImage(UIImage(named: "Compass-50"), for: .normal)
        mapButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        
        let mapBarButton = UIBarButtonItem()
        mapBarButton.customView = mapButton
        
        let settingsButton = UIButton()
        settingsButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        settingsButton.setImage(UIImage(named: "Settings-50"), for: .normal)
        settingsButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        
        let settingsBarButton = UIBarButtonItem()
        settingsBarButton.customView = settingsButton
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let toolbarButtons: [UIBarButtonItem] = [homeBarButton, spacer, mapBarButton, spacer, settingsBarButton]
        
        for button in toolbarButtons {
            button.tintColor = UIColor(named: UIColor.ColorName.turquoise)
        }
        
        self.addSubview(toolbar)
        self.toolbar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.toolbar.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.toolbar.translatesAutoresizingMaskIntoConstraints = false
        self.toolbar.setItems(toolbarButtons, animated: false)
    }
    
    func goHome(){
        
    }
    
    func showMap() {
        self.delegate?.showMap()
    }
    
    func sortAZ(){
        self.delegate?.sortAZ()
    }
    


    
    
}
