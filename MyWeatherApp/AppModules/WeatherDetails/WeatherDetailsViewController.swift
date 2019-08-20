//
//  WeatherDetailsViewController.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/15/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController , WeatherDetailsViewModelDelegate {
    func startLoadingIndicator() {
      activityIndicator.startAnimating()
    }
    
    func stopLoadingIndicator() {
        activityIndicator.stopAnimating()
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var currentDegreeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var holderStackView: UIStackView!
    @IBOutlet weak var backgroundImage : UIImageView!
    
    lazy var viewModel: WeatherDetailsViewModel = {
        let vm = WeatherDetailsViewModel()
        vm.delegate = self
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        viewModel.loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.cancelDataLoading()
    }

    func animateLabels(){
        UIView.animate(withDuration: 0.3) {
            self.holderStackView.subviews.forEach({ (view) in
                view.isHidden = false
                self.backgroundImage.alpha = 1.0
            })
        }
    }
    
    func fillViewData(data : WeatherCreatedData) {
        descriptionLabel.text = data.description
        currentDegreeLabel.text = data.currentDegree
        latitudeLabel.text = data.lat
        longitudeLabel.text = data.lon
    }
    
}
