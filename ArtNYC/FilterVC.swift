//
//  FilterVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/24/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit



protocol ReloadDelegate: class {
    func reloadTableView()
}

class FilterVC: UIViewController, FilterViewDelegate {
    
    var filterView: FilterView!
    var dismissButton: UIButton!
    var store = MuseumDataStore.sharedInstance
    var delegate: ReloadDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.filterView = FilterView()
        self.view = filterView
        self.filterView.delegate = self
    }
    
    func dismissView(){
        dismiss(animated: true, completion: nil)
    }
    
    func filterMuseums(){
        
        let interiorViewSwitch = self.filterView.interiorViewSwitch
        let freeAdmissionSwitch = self.filterView.freeAdmissionSwitch
        let openLateSwitch = self.filterView.openLateSwitch
        
        //Clear filtered museums
        store.filteredMuseums = []
        
        //Maintain switch state
        if interiorViewSwitch.isOn {
            store.interiorViewSwitchIsOn = true
        } else {
            store.interiorViewSwitchIsOn = false
        }
        
        if openLateSwitch.isOn {
            store.openLateSwitchIsOn = true
        } else {
            store.openLateSwitchIsOn = false
        }
        
        if freeAdmissionSwitch.isOn {
            store.freeAdmissionSwitchIsOn = true
        } else {
            store.freeAdmissionSwitchIsOn = false
        }
        
        
        //Filtering Cases
        // One switch is on
        if interiorViewSwitch.isOn && !openLateSwitch.isOn && !freeAdmissionSwitch.isOn {
            for museum in store.allMuseums {
                if museum.interiorMapView == true {
                    store.filteredMuseums.append(museum)
                }
            }
        }
        
        if !interiorViewSwitch.isOn && !openLateSwitch.isOn && freeAdmissionSwitch.isOn {
            for museum in store.allMuseums {
                if museum.freeAdmission == true {
                    store.filteredMuseums.append(museum)
                }
            }
        }
        
        if !interiorViewSwitch.isOn && openLateSwitch.isOn && !freeAdmissionSwitch.isOn {
            for museum in store.allMuseums {
                if museum.openLate == true {
                    store.filteredMuseums.append(museum)
                }
            }
        }
        
        //Two switches are on
        if !interiorViewSwitch.isOn && openLateSwitch.isOn && freeAdmissionSwitch.isOn {
            for museum in store.allMuseums {
                if museum.freeAdmission == true && museum.openLate == true {
                    store.filteredMuseums.append(museum)
                }
            }
        }
        
        if interiorViewSwitch.isOn && openLateSwitch.isOn && !freeAdmissionSwitch.isOn {
            for museum in store.allMuseums {
                if museum.interiorMapView == true && museum.openLate == true {
                    store.filteredMuseums.append(museum)
                }
            }
        }
        
        if interiorViewSwitch.isOn && !openLateSwitch.isOn && freeAdmissionSwitch.isOn {
            for museum in store.allMuseums {
                if museum.interiorMapView == true && museum.freeAdmission == true {
                    store.filteredMuseums.append(museum)
                }
            }
        }
        
        //Three switches are on/off
        if interiorViewSwitch.isOn && openLateSwitch.isOn && freeAdmissionSwitch.isOn {
            for museum in store.allMuseums {
                if museum.interiorMapView == true && museum.freeAdmission == true && museum.openLate == true {
                    store.filteredMuseums.append(museum)
                }
            }
        }
        
        if !interiorViewSwitch.isOn && !openLateSwitch.isOn && !freeAdmissionSwitch.isOn {
            store.filteredMuseums = []
        }
        
        
        for museum in store.filteredMuseums {
            print("\(museum.title):\nopen late = \(museum.openLate)\ninterior view = \(museum.interiorMapView)\nfree admission = \(museum.freeAdmission)")
            
        }
    }
    
}
