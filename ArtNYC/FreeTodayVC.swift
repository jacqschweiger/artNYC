//
//  FreeTodayVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 8/21/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class FreeTodayVC: UIViewController {
    
    let store = MuseumDataStore.sharedInstance
    let weekday = Calendar.current.component(.weekday, from: Date())
    var freeMuseums: [Museum] = []
    var freeTodayView: FreeTodayView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.freeTodayView = FreeTodayView()
        self.view = self.freeTodayView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true

        for museum in store.allMuseums {
            if museum.freeDay.contains(weekday) {
                freeMuseums.append(museum)
            }
        }
        
        self.freeTodayView.museums = self.freeMuseums
        
        for museum in self.freeTodayView.museums {
            print(museum.title ?? "no title")
        }
    }
        
}
