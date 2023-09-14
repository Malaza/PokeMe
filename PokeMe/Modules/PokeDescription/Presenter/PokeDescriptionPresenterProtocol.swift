//
//  PokeDescriptionPresenterProtocol.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeDescriptionPresenterProtocol {
    var view: (PokeDescriptionViewProtocol & UIViewController)? { get set }
    var router: PokeDescriptionRouterProtocol? { get set }
    var interactor: PokeDescriptionInteractorProtocol? { get set }
    
    //MARK: - Input
    func fetchPokeDescription(from url: String?) async
    func fetchImage(from url: URL) async -> UIImage?
    
    
    //MARK: - Output
    func interactorDidFetchPokeDescription(with result: Result<PokemonResponse, Error>)
    func pokemonObject() -> PokemonModel?
}
