//
//  MapViewFactory.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/17/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

struct MapViewFactory {
    static func makeMapWithNavigate() -> UINavigationController{
        let vc = MapViewController()
        vc.camera = GMSCameraPosition.camera(withLatitude: 30.0444, longitude: 31.2357, zoom: 6.0)
        return UINavigationController(rootViewController: vc)
    }
    
    static func makeMapWith(_ coordinates : Coordinates ) -> UIViewController {
        let vc = MapViewController()
        vc.camera = GMSCameraPosition.camera(withLatitude: coordinates.lat, longitude: coordinates.lon, zoom: 6.0)
        vc.hideNavButton.title = ""
        vc.hideNavButton.isEnabled = false
        return vc
    }
    typealias Coordinates = (lon : Double , lat : Double)
    
}

