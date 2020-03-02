//
//  CatCell.swift
//  NetworkingHW2.10
//
//  Created by Macbook on 28.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import UIKit

class RickAndMortyCell: UITableViewCell {
    
   
    @IBOutlet var rickAndMortyImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var createdLabel: UILabel!
    
    func configure(with rickAndMorty: RickAndMorty) {
        
        nameLabel.text = "Name: \(rickAndMorty.name ?? "🤗")"
        speciesLabel.text = "Spesie: \(rickAndMorty.species ?? "")"
        genderLabel.text = "Gender: \(rickAndMorty.gender ?? "")"
        createdLabel.text = "Created: \(rickAndMorty.created ?? "")"
        
        DispatchQueue.global().async {
            guard let stringURL = rickAndMorty.image else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.rickAndMortyImage.image = UIImage(data: imageData)
            }
        }
    }
}


