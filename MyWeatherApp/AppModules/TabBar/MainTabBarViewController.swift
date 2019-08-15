//
//  MainTabBarViewController.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/15/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    lazy var countriesList: UINavigationController = {
        let vc = CountriesListViewController(nibName: "CountriesListViewController", bundle: nil)
       // vc.tabBarItem.title = "Countries"
        vc.tabBarItem.image = #imageLiteral(resourceName: "earth")
        return UINavigationController(rootViewController: vc)
    }()
    
    lazy var profile: UINavigationController = {
        let vc = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        vc.tabBarItem.title = "Profile"
        vc.tabBarItem.image = #imageLiteral(resourceName: "profile")
        return UINavigationController(rootViewController: vc)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setViewControllers([countriesList , profile], animated: true)

    }

}
