//
//  PokeListPresenterProtocol.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeListPresenterProtocol {
    var view: (PokeListViewProtocol & UIViewController)? { get set }
    var router: PokeListRouterProtocol? { get set }
    var interactor: PokeListInteractorProtocol? { get set }
    
    //MARK: - Input
    func fetchPokeList() async
    
    
    //MARK: - Output
    func interactorDidFetchPokeList(with result: Result<PokemonListResponse, Error>)
    func numberOfItems() -> Int
    func pokemonAtIndex(index: Int) -> PokemonItemModel?
    func searchWithQuery(query: String)
}
