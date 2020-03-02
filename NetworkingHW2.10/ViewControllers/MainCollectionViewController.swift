//
//  MainCollectionViewController.swift
//  NetworkingHW2.10
//
//  Created by Macbook on 28.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import UIKit

enum UserActions: String, CaseIterable {
    case randomCat = "Random Cat"
    case rickAndMorty = "RickAndMorty"
    case countries = "Countries"
}

class MainCollectionViewController: UICollectionViewController {
    
    private let userActions = UserActions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let userAction = userActions[indexPath.item]
        
        switch userAction {
            
        case .randomCat: performSegue(withIdentifier: "randomCat", sender: nil)
        case .rickAndMorty: performSegue(withIdentifier: "rickAndMorty", sender: nil)
        case .countries: performSegue(withIdentifier: "country", sender: nil)
        }
        
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "rickAndMorty":
            let rickAndMortyVC = segue.destination as! RickAndMortyController
            rickAndMortyVC.fetchRickAndMorty()
        case "randomCat":
            let catVC = segue.destination as! RandomCatViewController
            catVC.fetchDataCats()
        case "country" :
            let countryVC = segue.destination as! ContriesController
            countryVC.fetchCoutryData()
        default:
            break
        }
    }
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: UIScreen.main.bounds.width - 48, height: 150)
    }
}
