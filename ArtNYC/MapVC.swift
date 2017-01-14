//
//  MapVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
//import MapKit
import GoogleMaps

class MapVC: UIViewController {
    
    //@IBOutlet weak var mapView: MKMapView!
    
    var store = MuseumDataStore.sharedInstance
    var selectedMuseum: Museum!
    var mapView: GMSMapView!
    //let regionRadius: CLLocationDistance = 6000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mapView.delegate = self
        
//        DispatchQueue.main.async {
//            let initialLocation = CLLocation(latitude: 40.7829, longitude: -73.9654)
//            self.centerMapOnLocation(location: initialLocation)
//        }
//        
//        mapView.addAnnotations(store.museums)
        
        let camera = GMSCameraPosition.camera(withLatitude: 40.7829, longitude: -73.9654, zoom: 12)
        self.mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        mapView.isMyLocationEnabled = false
        
        addLocations()
        
    }
    
    func addLocations(){
        for museum in store.museums {
            let position = museum.coordinate
            let marker = GMSMarker(position: position)
            marker.title = museum.title!
            marker.map = mapView
        }
        
    }
    
    
    // MARK: GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
    }
    
    
//    func centerMapOnLocation(location: CLLocation) {
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
//        mapView.setRegion(coordinateRegion, animated: true)
//    }
    
    
}

//extension MapVC: MKMapViewDelegate {
//
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if let annotation = annotation as? Museum {
//            let identifier = "pin"
//            var view: MKPinAnnotationView
//            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//                as? MKPinAnnotationView {
//                dequeuedView.annotation = annotation
//                view = dequeuedView
//            } else {
//                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//                view.canShowCallout = true
//                view.calloutOffset = CGPoint(x: -5, y: 5)
//                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
//            }
//            return view
//        }
//        return nil
//    }
//    
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        selectedMuseum = view.annotation as! Museum
//        
//        performSegue(withIdentifier: "showMuseum", sender: control)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showMuseum" {
//            let dest = segue.destination as! DetailVC
//            dest.museum = selectedMuseum
//        }
//    }
//}
