//
//  PokemonListDataSource.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import Foundation
import UIKit

class PokemonListDataSource: NSObject {
    let pokemons: [Pokemon] = []
    
    override init() {
        
        var pokemonList: [Pokemon] = []
        
        for _ in 0..<20 {
            if let pokemon = PokemonListDataSource.getPokemon(){
                pokemonList.append(pokemon)
            }
        }
        pokemons = pokemonList
    super.init()
        
    }

static func getPokemon() -> [PokemonSummaryViewModel] {
    var pokemonList: [Pokemon] = []
    guard let url = Bundle.main.url(forResource: "pokemon_detail", withExtension: "json"), let data = try? Data(contentsOf: url) else {
        return []
    }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    guard let pokemonList = try? decoder.decode(PokemonList.self, from: data) else {
        return []
    }
    let pokemons = pokemonList.results.map {pokemon in
        PokemonSummaryViewModel(image: <#T##UIImage#>, name: <#T##String#>)
    }
    
    return pokemons
}
}
extension PokemonListDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        1. Dequeue cell
        guard let pokemonCell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: indexPath) as? PokemonTableViewCell else {
            fatalError("Wrong type of cell")
        }
        
//        2.
        let currentPokemon = pokemons[indexPath.row]
        pokemonCell.configure(pokemon: currentPokemon)
//        3.
        return pokemonCell
    }
    
}

