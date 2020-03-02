//
//  CountriesCell.swift
//  NetworkingHW2.10
//
//  Created by Macbook on 03.03.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import UIKit


class CountriesCell: UITableViewCell {
    
    @IBOutlet var countryNameLabe: UILabel!
    @IBOutlet var shortLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!

    func configure(with country: Country) {
        
        countryNameLabe.text = "Name: \(country.name ?? "🤗")"
        shortLabel.text = country.alpha2Code ?? ""
        regionLabel.text = "Region: \(country.region ?? "")"
    }
}
