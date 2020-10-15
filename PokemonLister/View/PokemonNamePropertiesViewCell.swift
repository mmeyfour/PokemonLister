//
//  PokemonNamePropertiesViewCell.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 15/10/2020.
//

import UIKit

// MARK: Protocols
protocol PokemonPropertiesTableViewCellDelegate {
    func pokemonPropertiesCellDidToggleCollapseState()
}

// MARK: Cell
class PokemonNamePropertiesViewCell: UITableViewCell {
    static let identifier = "PokemonNamePropertiesViewCell"
    
    @IBOutlet weak var propertyNameLabel: UILabel!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var firtstColumnStackView: UIStackView!
    @IBOutlet weak var secondColumnStackView: UIStackView!
    
    var delegate:PokemonPropertiesTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
            @IBAction func didTapShowButton(_ sender: UIButton) {
        delegate?.pokemonPropertiesCellDidToggleCollapseState()
    }
    
    private func updateUI(with properties: [String], isCollapsed: Bool) {
        
        // configure show more/less button
        if properties.count > 5 {
            showButton.isHidden = false
            let title = isCollapsed ? "- show more" : "- show less"
            showButton.setTitle(title, for: .normal)
        } else {
            showButton.isHidden = true
        }
        
        // clear previous dynamic content
        for view in firtstColumnStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        for view in secondColumnStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        // add dynamic content
        var placeOnFirstColumn = true
        let limit = isCollapsed ? min(5, properties.count) : properties.count
        for item in properties[0..<limit] {
            let label = UILabel(frame: CGRect.zero)
            label.text = item
            label.font = UIFont.systemFont(ofSize: 15.0)
            label.sizeToFit()
            placeOnFirstColumn ? firtstColumnStackView.addArrangedSubview(label) : secondColumnStackView.addArrangedSubview(label)
            placeOnFirstColumn.toggle()
        }
    }
    
    func configure(with propertiesViewModel: PropertiesViewModel, isCollapsed: Bool) {
        propertyNameLabel.text = propertiesViewModel.title
        updateUI(with: propertiesViewModel.properties, isCollapsed: isCollapsed)
    }
}

