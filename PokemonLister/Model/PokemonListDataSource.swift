//
//  PokemonListDataSource.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import Foundation
import UIKit

class PokemonListDataSource: NSObject {
    let pokemons: [PokemonSummaryViewModel]
    
    override init() {
        pokemons = PokemonListDataSource.getPokemon()
        super.init()
    }
    
    static func getPokemon() -> [PokemonSummaryViewModel] {
        guard let url = Bundle.main.url(forResource: "pokemon_list", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return []
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let pokemonList = try? decoder.decode(PokemonList.self, from: data) else {
            return []
        }
        let pokemons = pokemonList.results.map {pokemon in
            PokemonSummaryViewModel(image: UIImage.mainImage(pokemonId: "1"), name: pokemon.name)
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
        
        //        2. Prepare cell
        let currentPokemon = pokemons[indexPath.row]
        pokemonCell.configure(pokemonSummary: currentPokemon)
        
        //        3. Return configured cell
        return pokemonCell
    }
    
}

