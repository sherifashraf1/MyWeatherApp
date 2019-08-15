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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        loadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = myTableData?.country
        cell.imageView?.image = #imageLiteral(resourceName: "country")
        return cell
    }
    
}
