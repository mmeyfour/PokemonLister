//
//  PokemonModels.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 13/10/2020.
//

import Foundation
import UIKit

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
    let types: [PokemonType]
    let abilities: [PokemonAbility]
    let moves: [PokemonMove]
}

struct PokemonSummaryViewModel {
    let image: UIImage
    let name: String
}
