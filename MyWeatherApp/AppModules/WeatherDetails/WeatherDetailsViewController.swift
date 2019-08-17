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
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var currentDegreeLabel: UILabel!
    @IBOutlet weak var minDegreeLabel: UILabel!
    @IBOutlet weak var maxDegreeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
          loadData()
    }
    
    func loadData(){
        WeatherRequest.weather(id: data?.id ?? 0).send(WeatherResponse.self) { (response) in
            switch response{
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }


}
