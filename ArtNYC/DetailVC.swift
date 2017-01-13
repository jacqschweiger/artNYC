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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(museum.name)
        
        self.view.backgroundColor = UIColor.blue
        
    }
    
    
    
}
