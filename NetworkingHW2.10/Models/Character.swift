//
//  Cat.swift
//  NetworkingHW2.10
//
//  Created by Macbook on 28.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import Foundation

struct RickAndMorty: Decodable {
    
    let name: String?
    let species: String?
    let gender: String?
    let image: String?
    let created: String?
    
}
    
    struct RickAndMortyDescription: Decodable {
        let results : [RickAndMorty]
    }
      
/*
    {
"info":{ "count":493,"pages":25,"next":"https://rickandmortyapi.com/api/character/?page=2","prev":""},
     "results"[
     {"id":1,"name":"RickSanchez","status":"Alive","species":"Human","type":"","gender":"Male","origin":{"name":"Earth (C-137)","url":"https://rickandmortyapi.com/api/location/1"},"location":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},
     "image":"https://rickandmortyapi.com/api/character/avatar/1.jpeg","episode"
    
 
 
 */
 
