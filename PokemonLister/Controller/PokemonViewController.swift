//
//  PokemonViewController.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import UIKit

class PokemonViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSamplePokemonList()
        loadSamplePokemon()
    }
    
    func loadSamplePokemon() {
        
        guard let url = Bundle.main.url(forResource: "pokemon_detail", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let pokemon = try? decoder.decode(Pokemon.self, from: data) else {
            return
        }
        
        print("We have received one pokemon with id \(pokemon.id) and name \(pokemon.name)")
        
    }
    
    func loadSamplePokemonList() {
        guard let url = Bundle.main.url(forResource: "pokemon_list", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let pokemonList = try? decoder.decode(PokemonList.self, from: data) else {
            return
        }
        
        print("we have recived a pokemon list with \(pokemonList.results.count) pokemons with names \(pokemonList.results.map{ $0.name}.joined(separator: ", "))")
        print("\(pokemonList.results.map{ $0.name})")
        for name in pokemonList.results.map{ $0.name} {
            print(name)
        }
    }
}



