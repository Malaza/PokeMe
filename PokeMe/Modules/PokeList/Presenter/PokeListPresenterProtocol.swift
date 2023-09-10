//
//  PokeListPresenterProtocol.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeListPresenterProtocol {
    var view: PokeListViewProtocol? { get set }
    var router: PokeListRouterProtocol? { get set }
    var interactor: PokeListInteractorProtocol? { get set }
    
    //MARK: - Input
    func fetchPokeList(request: PokeListRequest) async
    
    
    //MARK: - Output
    func interactorDidFetchPokeList(with result: Result<PokemonListResponse, Error>)
    func numberOfItems() -> Int
    func pokemonAtIndex(index: Int) -> PokemonModel?
}
