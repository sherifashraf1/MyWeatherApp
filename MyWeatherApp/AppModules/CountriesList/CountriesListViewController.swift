//
//  CountriesListViewController.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/15/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
        
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "UITabelViewCell")
        loadData()
    }
    
    @objc func openMap(){
        let vc = MapViewController()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITabelViewCell", for: indexPath)

        cell.textLabel?.text = myTableData?.country
        cell.detailTextLabel?.text = "\(myTableData?.coord?.lat ?? 0) ,\( myTableData?.coord?.lon ?? 0)"
        cell.imageView?.image = #imageLiteral(resourceName: "earth")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = tableData?[indexPath.row]
        let vc = WeatherDetailsViewController()
        vc.data = selectedCountry
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
