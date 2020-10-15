//
//  PokemonNameImageViewCell.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 15/10/2020.
//

import UIKit

class PokemonNameImageViewCell: UITableViewCell {

    static let identifier = "PokemonNameImageViewCell"

    @IBOutlet weak var imageStackView: UIStackView!
    
    func configure(with images: [UIImage]) {
        // clear previous state
        for view in imageStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        // load images
        for image in images {
            let newImageView = UIImageView(image: image)
            imageStackView.addArrangedSubview(newImageView)
        }
    }
    
}
