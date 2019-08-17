//
//  WeatherRequest.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/17/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import Foundation
import Alamofire
enum WeatherRequest : URLRequestBuilder {
    case weather(id : Int)
    case weatherLocation(cooreinates : Coordinates)
    var path: String {
        switch self {
        case .weather :
            return "weather"
        case .weatherLocation :
            return "lat={lat}&lon={lon}"
        }
    }
    
    var parameters: Parameters?{
        var param = defaultParams
        switch self {
        case .weather(let id):
            param["id"] = id
        case .weatherLocation(let cooreinates):
            param["lat"] = cooreinates.lat
            param["lon"] = cooreinates.lon
        }
        return param
    }
    
    var method: HTTPMethod{
        return .get
    }
    
    
}
