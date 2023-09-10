//
//  PokemonListResponse.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokemonListResponse: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [PokemonItemResponse]?
}
