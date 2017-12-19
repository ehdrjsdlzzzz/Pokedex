//
//  Pokemon.swift
//  pokedex3
//
//  Created by 이동건 on 2017. 12. 11..
//  Copyright © 2017년 이동건. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

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
    private var _pokemonURL: String!
    
    var name:String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    var type: String {
        return _type
    }
    
    var defense: String {
        return _defense
    }
    
    var attack: String {
        return _baseAttack
    }
    
    var weight: String {
        return _weight
    }
    
    var height: String {
        return _height
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
        self._pokemonURL = URL_BASE + URL_POKEMON + "\(pokedexID)"
    }
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete){
        SVProgressHUD.show()
        Alamofire.request(URL(string: self._pokemonURL)!).responseJSON { (response) in
            if let resultDict = response.result.value as? [String:Any] {
                if let weight = resultDict["weight"] as? Int {
                    self._weight = String(weight)
                }

                if let height = resultDict["height"] as? Int {
                    self._height = String(height)
                }

                if let stats = resultDict["stats"] as? [[String:Any]] {
                    if let defense = stats[3]["base_stat"] as? Int {
                        self._defense = String(defense)
                    }
                    if let attack = stats[4]["base_stat"] as? Int {
                        self._baseAttack = String(attack)
                    }
                }

                var typesArray:[String] = []

                if let types = resultDict["types"] as? [[String:Any]] {
                    for type in types {
                        if let typeDetail = type["type"] as? [String:String] {
                            if let typeName = typeDetail["name"] {
                                typesArray.append(typeName)
                            }
                        }
                    }
                }
                self._type = typesArray.joined(separator: "/")
            }
            completed()
            SVProgressHUD.dismiss()
        }
    }
}
