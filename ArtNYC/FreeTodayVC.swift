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
    var freeToday: [Museum] = []
    var freeTodayView = FreeTodayView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = self.freeTodayView

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
        for museum in store.allMuseums {
            if museum.freeDay.contains(weekday) {
                freeToday.append(museum)
            }
        }
        
        self.freeTodayView.museums = self.freeToday
        for museum in self.freeTodayView.museums {
            print(museum.title)
        }
    }
        
}
