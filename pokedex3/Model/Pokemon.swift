//
//  Pokemon.swift
//  pokedex3
//
//  Created by 이동건 on 2017. 12. 11..
//  Copyright © 2017년 이동건. All rights reserved.
//

import Foundation

class Pokemon {
    // id,identifier,species_id,height,weight,base_experience,order,is_default
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvolutionTxt: String!
    
    var name:String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
    }
}
