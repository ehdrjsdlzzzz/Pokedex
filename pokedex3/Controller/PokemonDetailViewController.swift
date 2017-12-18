//
//  PokemonDetailViewController.swift
//  pokedex3
//
//  Created by 이동건 on 2017. 12. 11..
//  Copyright © 2017년 이동건. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    var pokemon:Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var evoLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = pokemon.name
        mainImage.image = UIImage(named: "\(pokemon.pokedexID)")
        pokedexIdLabel.text = "\(pokemon.pokedexID)"
        currentEvoImage.image = UIImage(named: "\(pokemon.pokedexID)")
    }
}

// MARK: IBAction
extension PokemonDetailViewController {
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
