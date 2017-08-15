//
//  GoogleAPIClient.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 8/15/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation

class GoogleAPIClient {
    
    class func getHours(with completion: @escaping ([[String:AnyObject]])-> Void) {
        let urlString = "https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJN1t_tDeuEmsRUsoyG83frY4&key=\(Constants.key)"
        
        let url = URL(string: urlString)
        let session = URLSession.shared
        
        if let unwrappedURL = url {
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                if let unwrappedData = data {
                    do {
                        
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: AnyObject]
                        
                        let resultsJSON = responseJSON["results"]
                        
                        completion(resultsJSON as! [[String : AnyObject]])
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}

