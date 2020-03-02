//
//  CatsTableViewController.swift
//  NetworkingHW2.10
//
//  Created by Macbook on 28.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import UIKit

class RickAndMortyController: UITableViewController {
    
    private let rickAndMortyJsonURL = "https://rickandmortyapi.com/api/character/"
    private var rickAndMortyData: RickAndMortyDescription?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 175
    
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickAndMortyData?.results.count ?? 0
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RickAndMortyCell

        guard let rickAndMorty = rickAndMortyData?.results[indexPath.row] else { return cell }
        
        cell.configure(with: rickAndMorty)

        return cell
    }
     
    func fetchRickAndMorty() {

        guard let url = URL(string: rickAndMortyJsonURL) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
           
                self.rickAndMortyData = try! decoder.decode(RickAndMortyDescription.self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
           
        }.resume()

    }
    
}
