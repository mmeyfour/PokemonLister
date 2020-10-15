//
//  PokemonViewController.swift
//  PokemonLister
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let pokemonListDataSource = PokemonListDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
//        1. Register cell type
        let identifier = PokemonTableViewCell.identifier
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
//        2. connect data source
        tableView.dataSource = pokemonListDataSource
//        3. connect delegate
        tableView.delegate = self
    }
}

extension PokemonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: PokemonDetailViewController.segueIdentifier, sender: nil)
    }
}
