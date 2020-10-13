//
//  ViewController.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 13/10/2020.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        print(pokemon.id)
        print("estamos aqui")
    }
    
    
}

