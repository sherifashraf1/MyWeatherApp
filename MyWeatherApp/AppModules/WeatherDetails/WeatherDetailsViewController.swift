//
//  WeatherDetailsViewController.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/15/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {

    var data : CityModel?
    @IBOutlet weak var countryName : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryName.text = data?.country
    }


}
