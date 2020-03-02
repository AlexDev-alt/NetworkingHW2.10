//
//  RandomCatViewController.swift
//  NetworkingHW2.10
//
//  Created by Macbook on 28.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import UIKit

class RandomCatViewController: UIViewController {
    
    @IBOutlet var randomCatImageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var breedLabel: UILabel!
    
    private let imageURL = "https://api.thecatapi.com/v1/images/search"
    private var cat: [Cat] = []
    private let index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func fetchDataCats() {
        guard let url = URL(string: imageURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
     
                self.cat = try! decoder.decode([Cat].self, from: data)
                self.configure(with: self.cat[self.index])
        }.resume()
    }
    
    func configure(with cat: Cat) {
        
        guard let stringURL = cat.url else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        
        DispatchQueue.main.async {
            self.randomCatImageView.image = UIImage(data: imageData)
            
            self.activityIndicator.stopAnimating()
        }
        
    }
    
}
