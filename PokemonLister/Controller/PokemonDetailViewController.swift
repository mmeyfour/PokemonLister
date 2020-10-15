//
//  PokemonDetailViewController.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 15/10/2020.
//

import UIKit

class PokemonDetailViewController: ViewController {

    let pokemonDetailDataSource = PokemonDetailDataSource()
    static let segueIdentifier = "ShowPokemonDetail"
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationItem.title = pokemonDetailDataSource.pokemonName
    }
    func setupTableView() {
//        1. Register cell type
        let identifier = [PokemonNameTableViewCell.identifier,PokemonNameImageViewCell.identifier,PokemonNamePropertiesViewCell.identifier]
        for identifier in identifier {
            let nib = UINib(nibName: identifier, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: identifier)
        }
        
        // 2. Connect data source
        tableView.dataSource = pokemonDetailDataSource
        
        // 3. Disable separator
        tableView.separatorStyle = .none
        
        // 4. Connect delegate
        tableView.delegate = self
    }

}

extension PokemonDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let propertiesCell = cell as? PokemonNamePropertiesViewCell else {
            return
        }
        propertiesCell.delegate = self
    }
}

extension PokemonDetailViewController: PokemonPropertiesTableViewCellDelegate {
    func pokemonPropertiesCellDidToggleCollapseState() {
        pokemonDetailDataSource.toggleCollapseState()
        tableView.reloadData()
    }
}
