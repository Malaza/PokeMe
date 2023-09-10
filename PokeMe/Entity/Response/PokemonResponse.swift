//
//  PokemonResponse.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokemonResponse: Codable {
    var id: Int?
    var abilities: PokemonAbilitiesResponse?
    var base_experience: Int?
    var forms: [PokemonFormResponse]?
    var game_indices: [PokemonGameIndexResponse]?
    var height: Int?
    var held_items: PokemonHeldItemResponse?
    var is_default: Bool?
    var location_area_encounters: String?
    var moves: PokemonMovesResponse?
    var name: String?
    var order: Int?
//    var past_types
//    var species
//    var sprites
//    var stats
    var types: PokemonTypesResponse?
    var weight: Int?
}


class PokemonAbilitiesResponse: Codable {

    var ability: [PokemonAbilityResponse]?
    var is_hidden: Bool?
    var slot: Int?
}


class PokemonAbilityResponse: Codable {
    var name: String?
    var url: String?
}


class PokemonFormResponse: Codable {
    var name: String?
    var url: String?
}

class PokemonGameIndexResponse: Codable {
    var game_index: Int?
    var version: PokemonGameIndexVersionResponse?
}
    
class PokemonGameIndexVersionResponse: Codable {
    var name: String?
    var url: String?
}

class PokemonHeldItemResponse: Codable {
    
}

class PokemonMovesResponse: Codable {
    var move: [PokemonMoveResponse]?
    var version_group_details: PokemonVersionGroupDetailsResponse?
}

class PokemonMoveResponse: Codable {
    var name: String?
    var url: String?
}

class PokemonVersionGroupDetailsResponse: Codable {
//var level_learned_at: Int?
//var move_learn_method: {},
//var version_group: {}
}



class PokemonTypesResponse: Codable {
    
}
