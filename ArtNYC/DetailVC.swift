//
//  DetailVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class DetailVC: UIViewController {
    
    var store = MuseumDataStore.sharedInstance
    var museum: Museum!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var admissionLabel: UILabel!
    @IBOutlet weak var freeAdmissionLabel: UILabel!
    @IBOutlet weak var artCategoriesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements() {
        nameLabel.text = museum.name
        addressLabel.text = museum.address
    }
    
}
