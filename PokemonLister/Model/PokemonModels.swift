//
//  PokemonModels.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 13/10/2020.
//

import Foundation

struct item {
    let name: String
    let url: URL
    
}

struct Pokemon {
    
    struct PokemonType {
        let type: item
    }
    struct PokemonAbility {
        let ability: item
    }
    struct PokemonMove {
        let move: item
    }
    
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let baseExperience: String
    let type: [PokemonType]
    let ability: [PokemonAbility]
    let moves: [PokemonMove]
    
}
