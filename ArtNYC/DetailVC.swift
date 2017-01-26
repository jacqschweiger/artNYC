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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.getPlaceIDFromAPI {
            DispatchQueue.main.async {
                self.getPhotoReferenceFromAPI {
                    guard let photoReference = self.photoReference else { return }
                    self.photoURL = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(photoReference)&key=\(Constants.key2)"
                    self.detailView.photoURL = self.photoURL
                    self.detailView.reloadInputViews()
                }
            }
        }
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
