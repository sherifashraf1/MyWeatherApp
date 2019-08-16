//
//  CountryTableViewCell.swift
//  MyWeatherApp
//
//  Created by Sherif on 8/16/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit


protocol TableViewCellDelegate : class{
    func didTap(_ button : UIButton , cell : UITableViewCell)
}

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var mapBtn: UIButton!
    weak var delegate : TableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func openOnMap(_ sender: UIButton) {
        delegate?.didTap(sender, cell: self)
    }
}
