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
    
    func findFreeMuseums(){
        for museum in store.allMuseums {
            if museum.freeDay.contains(weekday) {
                freeToday.append(museum)
            }
        }
    }
    
        
}
