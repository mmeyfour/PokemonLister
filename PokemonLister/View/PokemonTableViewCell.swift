//
//  PokemonTableViewCell.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    static let identifier = "PokemonTableViewCell"

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonTextLabel: UILabel!
    
    func configure(pokemonSummary: PokemonSummaryViewModel) {
        pokemonTextLabel.text = pokemonSummary.name
        pokemonImageView.image = pokemonSummary.image
    }
}
