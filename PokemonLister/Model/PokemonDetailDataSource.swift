//
//  PokemonDetailDataSource.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 15/10/2020.
//

import Foundation
import UIKit

class PokemonDetailDataSource: NSObject {
    
    private let pokemonViewModel: PokemonViewModel?
    private var hasMovesCollapsed: Bool
    
    var pokemonName: String {
        return pokemonViewModel?.name ?? ""
    }
    
    override init(){
        pokemonViewModel = PokemonDetailDataSource.getPokemon()
        hasMovesCollapsed = false
    }
    
    func toggleCollapseState() {
        hasMovesCollapsed.toggle()
    }
    // remove when adding network code
    static func getPokemon() -> PokemonViewModel? {
        guard let url = Bundle.main.url(forResource: "pokemon_detail", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return nil
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let pokemon = try? decoder.decode(Pokemon.self, from: data) else {
            return nil
        }
        
        return pokemon.viewModel
    }
    
    private func configureNameCell(from pokemon: PokemonViewModel, cell: UITableViewCell) -> UITableViewCell {
        guard let nameCell = cell as? PokemonNameTableViewCell else {
            fatalError("Unexpected cell")
        }
        nameCell.configure(with: pokemon.name)
        return nameCell
    }
    private func configureImagesCell(from pokemon: PokemonViewModel, cell: UITableViewCell) -> UITableViewCell {
        guard let imagesCell = cell as? PokemonNameImageViewCell else {
            fatalError("Unexpected cell")
        }
        imagesCell.configure(with: pokemon.images)
        return imagesCell
    }
    private func configurePropertiesCell(from propertiesViewModel: PropertiesViewModel,isCollapse: Bool, cell: UITableViewCell) -> UITableViewCell {
        guard let propertiesCell = cell as? PokemonNamePropertiesViewCell else {
            fatalError("Unexpected cell")
        }
        propertiesCell.configure(with: propertiesViewModel, isCollapsed: isCollapse)
        return propertiesCell
    }
}

extension PokemonDetailDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemonViewModel = pokemonViewModel else {
            fatalError("Mising a view model")
        }
        
        let rowIndex = indexPath.row
        
        switch rowIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PokemonNameTableViewCell.identifier, for: indexPath)
            return configureNameCell(from: pokemonViewModel, cell: cell)
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PokemonNameImageViewCell.identifier, for: indexPath)
            return configureImagesCell(from: pokemonViewModel, cell: cell)
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: PokemonNamePropertiesViewCell.identifier, for: indexPath)
            return configurePropertiesCell(from: pokemonViewModel.characteristics, isCollapse: false, cell: cell)
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: PokemonNamePropertiesViewCell.identifier, for: indexPath)
            return configurePropertiesCell(from: pokemonViewModel.types, isCollapse: false, cell: cell)
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: PokemonNamePropertiesViewCell.identifier, for: indexPath)
            return configurePropertiesCell(from: pokemonViewModel.abilities, isCollapse: false, cell: cell)
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: PokemonNamePropertiesViewCell.identifier, for: indexPath)
            return configurePropertiesCell(from: pokemonViewModel.moves, isCollapse: hasMovesCollapsed, cell: cell)
        default:
            fatalError("Unexpected cell")
        }
    }
}


