//
//  DetailVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class DetailVC: UIViewController, GMSMapViewDelegate {
    
    var store = MuseumDataStore.sharedInstance
    var museum: Museum?
    var detailView: DetailView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var panoView: GMSPanoramaView!
    
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    
    @IBOutlet weak var admissionLabel: UILabel!
    @IBOutlet weak var freeAdmissionLabel: UILabel!
    @IBOutlet weak var artCategoriesLabel: UILabel!
    @IBOutlet weak var urlLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //panoView.moveNearCoordinate(self.museum.coordinate)
        
        //setUpElements()
    }
    
    
    override func loadView(){
        guard let museum = self.museum else { return }
        self.detailView = DetailView(frame: CGRect.zero, museum: museum)
        self.view = self.detailView
    }
    
    func setUpElements() {
        guard let museum = self.museum else { return }
        nameLabel.text = museum.title
        addressLabel.text = "Address: \(museum.address)"
        guard let sunday = museum.hours["Sunday"] else { return }
        guard let monday = museum.hours["Monday"] else { return }
        guard let tuesday = museum.hours["Tuesday"] else { return }
        guard let wednesday = museum.hours["Wednesday"] else { return }
        guard let thursday = museum.hours["Thursday"] else { return }
        guard let friday = museum.hours["Friday"] else { return }
        guard let saturday = museum.hours["Saturday"] else { return }
        sundayLabel.text = "Sunday: \(sunday)"
        mondayLabel.text = "Monday: \(monday)"
        tuesdayLabel.text = "Tuesday: \(tuesday)"
        wednesdayLabel.text = "Wednesday: \(wednesday)"
        thursdayLabel.text = "Thursday: \(thursday)"
        fridayLabel.text = "Friday: \(friday)"
        saturdayLabel.text = "Saturday: \(saturday)"
        admissionLabel.text = "Admission: \(museum.ticketPrice)"
        freeAdmissionLabel.text = "Free Admission: \(museum.freeHours)"
        artCategoriesLabel.text = "Art: \(museum.artCategories)"
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let museum = self.museum else { return }
        if segue.identifier == "showWebView" {
            let dest = segue.destination as! WebVC
            dest.museumURL = museum.url
        }
    }
    
}
