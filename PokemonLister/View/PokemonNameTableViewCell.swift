//
//  PokemonNameTableViewCell.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 15/10/2020.
//

import UIKit

class PokemonNameTableViewCell: UITableViewCell {
    
    static let identifier = "PokemonNameTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with name: String) {
        nameLabel.text = name
    }
}
