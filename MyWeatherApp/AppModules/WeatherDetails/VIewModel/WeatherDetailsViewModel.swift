//
//  WeatherDetailsViewModel.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/20/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import Foundation

protocol WeatherDetailsViewModelDelegate: class{
    func startLoadingIndicator()
    func stopLoadingIndicator()
    func fillViewData(data : WeatherCreatedData)
    func animateLabels()
}

class WeatherDetailsViewModel{
//    private var data: CityModel?
    private var request: WeatherRequest?
    var cityID : Int?
    weak var delegate: WeatherDetailsViewModelDelegate?
    
    func loadData(){
        delegate?.startLoadingIndicator()
        request = WeatherRequest.weather(id: cityID ?? 0)
        request?.send(WeatherResponse.self) { [weak self] (response) in
            self?.handleResponse(response)
        }
        
    }
    
    func cancelDataLoading(){
        request?.cancelRequest()
    }
    
    fileprivate func handleResponse(_ response: ServerResponse<WeatherResponse>) {
        delegate?.stopLoadingIndicator()
        switch response{
        case .success(let value):
            let toViewData = prepareDataToView(with: value)
            delegate?.fillViewData(data: toViewData)
            delegate?.animateLabels()
            
        case .failure(let error):
            print(error)
        }
    }
    
    private func prepareDataToView(with value : WeatherResponse) -> WeatherCreatedData {
        guard let temp = value.main?.temp,let lat = value.coord?.lat, let lon = value.coord?.lon else
        { return WeatherCreatedData(description: nil, currentDegree: nil, lat: nil, lon: nil) }
        
        return WeatherCreatedData(description: value.name,
                                  currentDegree: "\(temp.rounded().string)" + "℃",
                                  lat: lat.string,
                                  lon: lon.string)
    }
    
}
