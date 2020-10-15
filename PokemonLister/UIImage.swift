//
//  UIImage.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import Foundation
import UIKit

extension UIImage {
    static func mainImage(pokemonId: Int?) -> UIImage {
        guard let pokemonId = pokemonId,
              let mainImageUrl = Bundle.main.url(forResource: "\(pokemonId)", withExtension: "png"),
              let imageData = try? Data(contentsOf: mainImageUrl),
              let image = UIImage(data: imageData)
        else {
            return UIImage(named: "0")!
        }
        
        return image
    }
    
    static func allImages(pokemonId: Int) -> [UIImage] {
        // Note: this is O(N) with the number of images.
        // If having too many images, another approach is recommended (e.g. subfolders by id)
        guard let urls = Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: nil) else {
            return [UIImage(named: "0")!]
        }
        
        let pokemonUrls = urls.filter { url in
            guard let filename = url.pathComponents.last else { return false }
            return filename.starts(with: "\(pokemonId).") || filename.starts(with: "\(pokemonId)-")
        }

        let imagesFound =  pokemonUrls.compactMap({ try? Data(contentsOf: $0)}).compactMap({ UIImage(data: $0) })
        if imagesFound.count == 0 {
            return [UIImage(named: "0")!]
        } else {
            return imagesFound
        }
    }
}
