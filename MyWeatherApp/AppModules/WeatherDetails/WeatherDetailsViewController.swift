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
    var request : WeatherRequest?
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var currentDegreeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
          loadData()
    }
    
    func loadData(){
        request = WeatherRequest.weather(id: data?.id ?? 0)
        request?.send(WeatherResponse.self) { (response) in
            switch response{
            case .success(let value):
                self.descriptionLabel.text = value.sys?.country
                self.currentDegreeLabel.text = value.main?.temp?.string
                self.pressureLabel.text = value.main?.pressure?.string ?? "0"
                self.humidityLabel.text = value.main?.humidity?.string ?? "0"
            case .failure(let error):
                print(error)
            }
        }
    }

}
extension Double {
    var string : String{
        return String(describing: self)
    }
}
