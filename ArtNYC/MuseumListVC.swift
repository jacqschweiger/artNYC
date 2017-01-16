//
//  MuseumListVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/14/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import NotificationCenter

class MuseumListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var museumTableView: UITableView!
    
    @IBAction func filterPressed(_ sender: Any) {
        sortAZ()
    }
    
    var store = MuseumDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.loadMuseums()
        self.reloadInputViews()
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.topItem?.title = "Art Museums NYC"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.museums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as! MuseumTableViewCell
        cell.museumNameLabel.text = store.museums[indexPath.row].title
        cell.museumLogo.image = store.museums[indexPath.row].logo
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let dest = segue.destination as? DetailVC,
                let indexPath = museumTableView.indexPathForSelectedRow {
                dest.museum = store.museums[indexPath.row]
            }
        }
        
        if segue.identifier == "showMap" {
            _ = segue.destination as? MapVC
        }
    }
    
    
    // TODO: create filter/sort menu and functions: sort by alpha; filter by museums with free admission, google street view interiors, art category
    
    func sortAZ(){
        store.museums.sort { (museum1, museum2) -> Bool in
            return museum1.title! < museum2.title!
        }
        museumTableView.reloadData()
    }
    
    func sortZA(){
        store.museums.sort { (museum1, museum2) -> Bool in
            return museum1.title! > museum2.title!
        }
        
        museumTableView.reloadData()
    }
    
    
    
}
