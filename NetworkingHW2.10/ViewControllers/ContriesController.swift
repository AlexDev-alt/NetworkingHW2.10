//
//  ContriesController.swift
//  NetworkingHW2.10
//
//  Created by Macbook on 02.03.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import UIKit

class ContriesController: UITableViewController {
    
    private var countries: [Country] = []
    private let urlString = "https://restcountries.eu/rest/v2/all"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountriesCell
        
        let country = countries[indexPath.row]
        cell.configure(with: country)
        
        return cell
    }
    
    func fetchCoutryData() {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            
            self.countries = try! decoder.decode([Country].self, from: data)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
}




