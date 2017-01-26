//
//  PhotosAPIClient.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/25/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import GooglePlaces

class PhotosAPIClient {
    
    static let urlString: String = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=CoQBdwAAAKBaoqRUTZK8K7czfSDnsMJAYayfB1Tczxg0mqCD6wYn7NhI4ICUhgeDjDUGIht3GViGT1qGgxQlfLE0yT06hxPHG5aVr6mC2upgr8bxV1pdOZgY8BKgFEQBcM4twRlzhbXLr5fJwSNSCGc4vw8Gv-mGnAn8eFpPsWyXz1uNWjx0EhBD4zTegJwXN3FiFfhOPYeqGhSC8TBD41ABiHkTGFtmw1kANQWmLA&key=AIzaSyDVfmnEa-AgJdoLFoaZcy9ZBCH3jeVEGSE"
    
    var placeSearchString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7813,-73.9603&radius=200&keyword=neue+galerie&type=museum&key=\(Constants.key2)"
    
    var placeDetailsString = "https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJ01_9-ZdYwokRL2JrA28GJp8&key=\(Constants.key2)"
    
    var photoString = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=CoQBdwAAALmVFXv0igmO0Uj6MyT5N-h1zNgQIpqUvHzqmeBVcWJlfRADOb1EwvhCgwdSiAN_zFk-7K4ybHUbUjHigJjawD2rYvBTwKp8MG1Vk3ODaWxUvlsQEZwTSJIsux5HI00a8SutvpLy6jYVPFnLuXwJVRphvxtN-TfqU5rkMD0e8Br6EhAugi_MGB5o0aoni7Y2WC5iGhTxepDW_NSHpH8Y-WQkenHINrFcAw&key=\(Constants.key2)"
    
}

