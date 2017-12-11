//
//  ViewController.swift
//  pokedex3
//
//  Created by 이동건 on 2017. 12. 2..
//  Copyright © 2017년 이동건. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var pokemons:[Pokemon] = []
    var filteredPokemon:[Pokemon] = []
    var inSearchMode:Bool = false
    
    @IBOutlet weak var pokeCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var musicPlayer:AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeCollectionView.dataSource = self
        pokeCollectionView.delegate = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = .done
        
        parsePokemonCSV()
        initAudio()
    }

}

// MARK: IBAction

extension ViewController {
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        if musicPlayer.isPlaying {
            musicPlayer.pause()
            sender.alpha = 0.2
        }else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
}

// MARK: Additional Function

extension ViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailViewController" {
            if let detailViewController = segue.destination as? PokemonDetailViewController {
                if let pokemonData = sender as? Pokemon {
                    detailViewController.pokemon = pokemonData
                }
            }
        }
    }
    
    func initAudio(){
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1 // 계속해서 반복재생
            musicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    func parsePokemonCSV(){
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            for row in rows{
                let pokemon = Pokemon(name: row["identifier"]!, pokedexID: Int(row["id"]!)!)
                pokemons.append(pokemon)
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}

// MARK: UISearchBarDelegate Protocol

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            pokeCollectionView.reloadData()
            view.endEditing(true)
        }else {
            inSearchMode = true
            let lower = searchBar.text?.lowercased()
            filteredPokemon = pokemons.filter({$0.name.range(of: lower!) != nil})
            pokeCollectionView.reloadData()
        }
    }
}

// MARK: UICollectionViewDataSource Protocol
extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !inSearchMode {
            return pokemons.count
        }
        
        return filteredPokemon.count
     }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if !inSearchMode {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
                cell.configureCell(pokemon: pokemons[indexPath.row])
                
                return cell
            }else {
                return UICollectionViewCell()
            }
        }else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
                cell.configureCell(pokemon: filteredPokemon[indexPath.row])
                
                return cell
            }else {
                return UICollectionViewCell()
            }
        }
        
    }
    
    
}

// MARM: UICollectionViewDelegate Protocol
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if inSearchMode {
            performSegue(withIdentifier: "PokemonDetailViewController", sender: filteredPokemon[indexPath.row])
        }else {
            performSegue(withIdentifier: "PokemonDetailViewController", sender: pokemons[indexPath.row])
        }
    }
}

// MARK: UICollectionViewFlowLayout Protocol UI Setting
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105) // Cell Size
    }
}

