//
//  MapViewController.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/15/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
class MapViewController: UIViewController {
    
    lazy var hideNavButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Hide", style: .done, target: self, action: #selector(dismissMapView))
    }()
    
    var camera: GMSCameraPosition?
    
    lazy var mapView: GMSMapView = {
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera!)
        return mapView
    }()
    
    lazy var marker: GMSMarker = {
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 30.0444, longitude: 31.2357)
        marker.title = "Cairo"
        marker.snippet = "Egypt"
        return marker
    }()
    
    @objc func dismissMapView(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map View"
        navigationItem.setRightBarButton(hideNavButton, animated: true)
        view = mapView
        marker.map = mapView
        
        
    }
    
}
