//
//  PokeCell.swift
//  pokedex3
//
//  Created by 이동건 on 2017. 12. 11..
//  Copyright © 2017년 이동건. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    
    var pokemon:Pokemon!
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        layer.cornerRadius = 5.0
//    }
    
    func configureCell(pokemon:Pokemon){
        self.pokemon = pokemon
        
        pokeNameLabel.text = self.pokemon.name.capitalized
        pokeImageView.image = UIImage(named: "\(self.pokemon.pokedexID)")
        
        layer.cornerRadius = 5.0
    }
    
    override func prepareForReuse() {
        self.pokeNameLabel.text = nil
        self.pokeImageView.image = nil
    }
    
    
}
