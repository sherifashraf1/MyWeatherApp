//
//  CountriesListViewController.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/15/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class CountriesListViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    var tableData : Cities?
    
    lazy var mapBarButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Map", style: .plain, target: self, action: #selector(openMap))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        navigationItem.setLeftBarButton(mapBarButton, animated: true)
        let cell = UINib(nibName: "CountryTableViewCell", bundle: nil)
        tableView.register(cell.self, forCellReuseIdentifier: "UITabelViewCell")
        loadData()
    }
    
    @objc func openMap(){
        let vc = MapViewFactory.makeMapWithNavigate()
        present(vc, animated: true, completion: nil)
    }
    
    func loadData(){
        if let path = Bundle.main.path(forResource: "city.list", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL.init(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                tableData = try decoder.decode(Cities.self, from: data)
                tableView.reloadData()
            }
            catch {
                print(error)
            }
        }
    }
}

extension CountriesListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myTableData = tableData?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITabelViewCell", for: indexPath) as! CountryTableViewCell

        cell.countryName?.text = myTableData?.country
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = tableData?[indexPath.row]
        let vc = WeatherDetailsViewController()
        vc.viewModel.cityID = selectedCountry?.id
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CountriesListViewController : TableViewCellDelegate {
    func didTap(_ button: UIButton, cell: UITableViewCell) {
        guard let index = tableView.indexPath(for: cell) else {return}
        let data = tableData?[index.row]
        let vc = MapViewFactory.makeMapWith((data?.coord?.lat ?? 0 , data?.coord?.lon ?? 0))
        navigationController?.pushViewController(vc, animated: true)

    }
    
}
