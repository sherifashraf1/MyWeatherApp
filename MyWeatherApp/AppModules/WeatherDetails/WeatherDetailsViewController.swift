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
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
          loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        request?.cancelRequest()
        //currentDegreeLabel.text = ""
    }
    
    fileprivate func handleResponse(_ response: ServerResponse<WeatherResponse>) {
        switch response{
        case .success(let value):
            guard let temp = value.main?.temp,let lat = value.coord?.lat, let lon = value.coord?.lon   else {return}

            descriptionLabel.text = value.name
            currentDegreeLabel.text = "\(TempConvertor.celsiusToFahrenheit(tempInC: temp).rounded().string)"+"℃"
            latitudeLabel.text  =  lat.string
            longitudeLabel.text = lon.string
        case .failure(let error):
            print(error)
        }
    }
    
    func loadData(){
        request = WeatherRequest.weather(id: data?.id ?? 0)
        request?.send(WeatherResponse.self) { [weak self] (response) in
            self?.handleResponse(response)
        }
    }

}


