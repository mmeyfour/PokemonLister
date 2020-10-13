//
//  PokemonModels.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 13/10/2020.
//

import Foundation

struct Item: Codable {
    let name: String
    let url: URL
    
}
struct PokemonList: Codable {
    let results: [Item]
    let next: URL?
}

struct Pokemon: Codable {
    
    struct PokemonType: Codable {
        let type: Item
    }
    
    struct PokemonAbility: Codable {
        let ability: Item
    }
    
    struct PokemonMove: Codable {
        let move: Item
    }
    
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let baseExperience: Int
    let type: [PokemonType]
    let ability: [PokemonAbility]
    let moves: [PokemonMove]
}
