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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 30.0444, longitude: 31.2357, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 30.0444, longitude: 31.2357)
        marker.title = "Cairo"
        marker.snippet = "Egypt"
        marker.map = mapView


    }
    
}
