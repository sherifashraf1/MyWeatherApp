//
//  WeatherDetailsViewController.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/15/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var currentDegreeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var holderStackView: UIStackView!
    @IBOutlet weak var backgroundImage : UIImageView!
    
    
    lazy var viewModel: WeatherDetailsViewModel = {
        let vm = WeatherDetailsViewModel()
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
          viewModel.loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModel.request?.cancelRequest()
        //currentDegreeLabel.text = ""
    }

    
    func animateLabels(){
        UIView.animate(withDuration: 0.3) {
            self.holderStackView.subviews.forEach({ (view) in
                view.isHidden = false
                self.backgroundImage.alpha = 1.0

            })
        }
    }
    
    func fillDataToLabels(with value : WeatherResponse){
        guard let temp = value.main?.temp,let lat = value.coord?.lat, let lon = value.coord?.lon   else {return}
//        descriptionLabel.text = value.name
//        //Show temp By Celsius
//        currentDegreeLabel.text = "\(temp.rounded().string)" + "℃"
//        //Show temp By Fahrenheit
//        //currentDegreeLabel.text = "\(TempConvertor.celsiusToFahrenheit(tempInC: temp).rounded().string)"+"℉"
//        latitudeLabel.text  =  lat.string
//        longitudeLabel.text =  lon.string
    }
    
    func fillViewData(_ description : String, currentDegree : String, lat : String, lon : String) {
        descriptionLabel.text = description
        currentDegreeLabel.text = currentDegree
        latitudeLabel.text = lat
        longitudeLabel.text = lon
    }


class WeatherDetailsViewModel{
    var data : CityModel?
    var request : WeatherRequest?

    func loadData(){
        request = WeatherRequest.weather(id: data?.id ?? 0)
        request?.send(WeatherResponse.self) { [weak self] (response) in
            self?.handleResponse(response)
        }
        
    }

    fileprivate func handleResponse(_ response: ServerResponse<WeatherResponse>) {
        switch response{
        case .success(let value):
            fillDataToLabels(with: value)
            animateLabels()
        case .failure(let error):
            print(error)
        }
    }

    
}
