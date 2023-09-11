//
//  PokemonResponse.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokemonResponse: Codable {
    var id: Int?
    var name: String?
    var abilities: [PokemonAbilitiesResponse]?
    var base_experience: Int?
    var forms: [PokemonFormResponse]?
    var game_indices: [PokemonGameIndexResponse]?
    var height: Int?
    var held_items: PokemonHeldItemResponse?
    var is_default: Bool?
    var location_area_encounters: String?
    var moves: [PokemonMovesResponse]?
    var order: Int?
    var species: PokemonSpeciesResponse?
    var sprites: PokemonSpritesResponse?
    var types: [PokemonTypesResponse]?
    var weight: Int?
}


class PokemonAbilitiesResponse: Codable {

    var ability: PokemonAbilityResponse?
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
    var move: PokemonMoveResponse?
    var version_group_details: PokemonVersionGroupDetailsResponse?
}

class PokemonMoveResponse: Codable {
    var name: String?
    var url: String?
}

class PokemonVersionGroupDetailsResponse: Codable {}

class PokemonSpeciesResponse: Codable {
    var name: String?
    var url: String?
}

class PokemonSpritesResponse: Codable {
    var back_default: String?
    var back_female: String?
    var back_shiny: String?
    var back_shiny_female: String?
    var front_default: String?
    var front_female: String?
    var front_shiny: String?
    var front_shiny_female: String?
    var other: PokemonSpritesOtherResponse?
}

class PokemonSpritesOtherResponse: Codable {
    var dream_world: PokemonSpritesDreamWorldResponse?
    var home: PokemonSpritesHomeResponse?
    var official_artwork: PokemonSpritesOfficialArtworkResponse?
}

class PokemonSpritesDreamWorldResponse: Codable {
    var front_default: String?
    var front_female: String?
}

class PokemonSpritesHomeResponse: Codable {
    var front_default: String?
    var front_female: String?
    var front_shiny: String?
    var front_shiny_female: String?
    }

class PokemonSpritesOfficialArtworkResponse: Codable {
    var front_default: String?
    var front_female: String?
}

class PokemonTypesResponse: Codable {}




