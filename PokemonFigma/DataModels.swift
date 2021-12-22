//
//  DataModels.swift
//  PokemonFigma
//
//  Created by Vladislav on 21.12.2021.
//

import Foundation
import Alamofire

// Data model
struct Pokemon: Codable {
    let name: String?
    let url: String?
}
