//
//  HomeScreenVC.swift
//  PokemonFigma
//
//  Created by Vladislav on 20.12.2021.
//

import UIKit
import Alamofire


class HomeScreenVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Table view's outlet
    @IBOutlet weak var pokemonTableView: UITableView!
    // Empty var for storing data
    let cellId = "PokemonTableViewCell"
    private var pokemonsData: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Standart TableView operations
        self.pokemonTableView.delegate = self
        self.pokemonTableView.dataSource = self
        
        // Register custom table cell's xib
        let cellNib = UINib(nibName: cellId, bundle: .main)
        self.pokemonTableView.register(cellNib, forCellReuseIdentifier: cellId)
        
        // Call function that gets data
        getPokemonNames()
        
    }
    // Defining function to get data
    private func getPokemonNames() {
        let url = "https://pokeapi.co/api/v2/pokemon?limit=151"
        
        AF
            .request(url, method: .get)
            .responseJSON { output in
            
                if let json = try? output.result.get(),
                    // json stores data as type [String: Any]
                    let dict = json as? [String: Any] {
                    // going to results directory because objects are nested in it
                    let result = dict["results"]
                    // data is binary so we make it readable for json decoder
                    let data = try! JSONSerialization.data(withJSONObject: result, options:  [])
                    // decoding data adding it to [Pokemon]
                    self.pokemonsData = (try? JSONDecoder().decode([Pokemon].self, from: data)) ?? []
                    print(self.pokemonsData.count)
                    self.pokemonTableView.reloadData()
                }
            }
        
        // Needed to reload data in tableview in order to show it on the screen
    }
    
    
    
    // TableView Functions
    // Set amount of rows based on amount of data
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonsData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = pokemonTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? PokemonTableViewCell {
            cell.pokemonCellLabel.text = self.pokemonsData[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
    
}

