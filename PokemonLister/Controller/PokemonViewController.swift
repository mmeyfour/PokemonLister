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
        registerCell()
        
        
    }
    func registerCell() {
        let identifier = PokemonTableViewCell.identifier
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
}



