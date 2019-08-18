//
//  TempConvertor.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/18/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import Foundation
struct TempConvertor {
    // Convert from F to C (Double)
    static func fahrenheitToCelsius(tempInF:Double) ->Double {
        let celsius = (tempInF - 32.0) * (5.0/9.0)
        return celsius as Double
    }
    // Convert from C to F (Integer)
    static func celsiusToFahrenheit(tempInC:Double) ->Double {
        let fahrenheit = (tempInC * 9.0/5.0) + 32.0
        return fahrenheit as Double
    }
    
    
}
