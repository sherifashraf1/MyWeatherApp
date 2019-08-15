//
//  CityModel.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/15/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import Foundation

// MARK: - MovieModelElement
struct CityModel: Codable {
    let id: Int?
    let name, country: String?
    let coord: Coord?
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
}

typealias Cities = [CityModel]
