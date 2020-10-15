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

extension Item {
    var id: Int? {
        guard let idAsString = url.absoluteString.split(separator: "/").last else {
            return nil
        }
        return Int(idAsString)
    }
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

extension Pokemon {
    var viewModel: PokemonViewModel {
        let characteristicsViewModel = PropertiesViewModel(title: "Characteristics",
                                                  properties: ["Base experience: \(baseExperience)",
                                                                "Weight: \(weight)",
                                                                "Height: \(height)"])
        
        let abilitiesViewModel = PropertiesViewModel(title: "Abilities",
                                                  properties: abilities.map { $0.ability.name })
        let movesViewModel = PropertiesViewModel(title: "Moves",
                                                  properties: moves.map { $0.move.name })
        let typesViewModel = PropertiesViewModel(title: "Types",
                                                  properties: types.map { $0.type.name })
        
        return PokemonViewModel(name: name,
                                images: UIImage.allImages(pokemonId: id),
                                characteristics: characteristicsViewModel,
                                abilities: abilitiesViewModel,
                                moves: movesViewModel,
                                types: typesViewModel)
    }
}

struct PokemonViewModel {
    let name: String
    let images: [UIImage]
    let characteristics: PropertiesViewModel
    let abilities: PropertiesViewModel
    let moves: PropertiesViewModel
    let types: PropertiesViewModel
}

struct PropertiesViewModel {
    let title: String
    let properties: [String]
}
