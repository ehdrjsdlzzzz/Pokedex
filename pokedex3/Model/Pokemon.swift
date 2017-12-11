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
