//
//  MapViewFactory.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/17/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit
import GooglePlaces
struct MapViewFactory {
    static func makeMapWithNavigate() -> UINavigationController{
        return UINavigationController(rootViewController: MapViewController())
    }
    
    static func makeMapWith(_ coordinates : Coordinates ) -> UIViewController {
        return MapViewController()
    }
    typealias Coordinates = (lon : Double , lat : Double)
    
}

