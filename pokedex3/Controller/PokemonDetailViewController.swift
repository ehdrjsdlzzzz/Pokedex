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
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nil
        mainImage.image = nil
        typeLabel.text = nil
        defenseLabel.text = nil
        heightLabel.text = nil
        pokedexIdLabel.text = nil
        weightLabel.text = nil
        baseAttackLabel.text = nil
        pokemon.downloadPokemonDetail {
            // 다운로드가 완료되면 실행되는 클로져
            self.updateUI()
        }
    }
}

// MARK: Additional Method

extension PokemonDetailViewController {
    func updateUI(){
        nameLabel.text = pokemon.name
        mainImage.image = UIImage(named: "\(pokemon.pokedexID)")
        pokedexIdLabel.text = "\(pokemon.pokedexID)"
        typeLabel.text = pokemon.type
        defenseLabel.text = pokemon.defense
        baseAttackLabel.text = pokemon.attack
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
    }
}

// MARK: IBAction
extension PokemonDetailViewController {
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
