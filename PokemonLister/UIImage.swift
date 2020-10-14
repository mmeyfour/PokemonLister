//
//  UIImage.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import Foundation
import UIKit

extension UIImage{
    static func mainImage(pokemonId: String?) -> UIImage {
        guard let pokemonId = pokemonId else {
            return UIImage(named: "")!
        }
        guard let mainImageUrl = Bundle.main.url(forResource: pokemonId, withExtension: "png", subdirectory: "Images"),
              let imageData = try? Data(contentsOf: mainImageUrl),
              let image = UIImage(named: "0")
        else {
            return UIImage(named: "0")!
        }
        return image
    }
}
