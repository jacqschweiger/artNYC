//
//  MuseumListView.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/17/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

protocol ShowDetailViewDelegate: class {
    func goToDetailView()
    func showFilter()
}

class MuseumListView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: ShowDetailViewDelegate?
    let header = UILabel()
    let tableView = UITableView()
    var store = MuseumDataStore.sharedInstance
    var selectedMuseum: Museum!
    var filterButton = UIButton()
    var placeID: String?
    var photoReference: String?
    var photoURL: String?
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setUpElements()
        
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
        
        self.getPlaceIDFromAPI {
            self.getPhotoReferenceFromAPI {
                guard let photoReference = self.photoReference else { return }
                self.photoURL = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(photoReference)&key=\(Constants.key2)"
            }
        }
        self.delegate?.goToDetailView()
    }
    
    func setUpElements(){
        let filler = UILabel()
        self.addSubview(filler)
        filler.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        filler.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        filler.heightAnchor.constraint(equalToConstant: 6).isActive = true
        filler.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        filler.translatesAutoresizingMaskIntoConstraints = false
        
        //Header Set Up
        self.addSubview(header)
        self.header.topAnchor.constraint(equalTo: filler.bottomAnchor).isActive = true
        self.header.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        header.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        header.text = "Art Museums NYC"
        header.font = UIFont(name: "Avenir Black", size: 26)
        header.textAlignment = .center
        header.textColor = UIColor.white
        
        //Filter Set Up
        
        self.insertSubview(filterButton, aboveSubview: header)
        self.filterButton.setTitle("•••", for: .normal)
        self.filterButton.addTarget(self, action: #selector(showFilter), for: .touchUpInside)
        
        self.filterButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        self.filterButton.centerYAnchor.constraint(equalTo: self.header.centerYAnchor).isActive = true
        self.filterButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Table View Set Up
        self.addSubview(tableView)
        self.tableView.topAnchor.constraint(equalTo: self.header.bottomAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.tableView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func showFilter(){
        self.delegate?.showFilter()
    }
    
    // MARK: API Functions
    
    func getPlaceIDFromAPI(completion: @escaping ()->()) {
        //let museumTitle = museum.title?.replacingOccurrences(of: " ", with: "+")
        let museumTitle = "neue+galerie"
        PhotosAPIClient.getPlaceID(with: museumTitle) { (results) in
            let newResults = results[0]
            self.placeID = newResults["place_id"] as! String
            completion()
        }
    }
    
    func getPhotoReferenceFromAPI(completion: @escaping ()->()) {
        guard let placeID = self.placeID else { return }
        
        PhotosAPIClient.getPhotoReference(with: placeID) { (results) in
            
            let photos = results["photos"] as! [[String: Any]]
            let photoDetails = photos[0]
            self.photoReference = photoDetails["photo_reference"] as! String!
            completion()
        }
    }
    
}

