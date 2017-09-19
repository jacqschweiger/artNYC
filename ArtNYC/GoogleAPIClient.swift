//
//  GoogleAPIClient.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 8/15/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//
import Foundation

class GoogleAPIClient {
    
    class func getHours(with placeID: String, completion: @escaping ([String])-> Void) {
        print("get hours called")
        
        let urlString = "https://maps.googleapis.com/maps/api/place/details/json?placeid=\(placeID)&key=\(Constants.key)"
        
        let url = URL(string: urlString)
        let session = URLSession.shared
        
        if let unwrappedURL = url {
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                if let unwrappedData = data {
                    do {
                        
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: AnyObject]
                        
                        let resultJSON = responseJSON["result"] as! [String: AnyObject]
                        
                        guard let hoursJSON = resultJSON["opening_hours"] as? [String: AnyObject] else { return }
                        
                        let weekdayJSON = hoursJSON["weekday_text"]
                        
                        completion(weekdayJSON as! [String])
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
}
