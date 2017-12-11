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
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = pokemon.name
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
