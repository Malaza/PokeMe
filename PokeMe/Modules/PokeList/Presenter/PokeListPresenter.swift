//
//  PokeListPresenter.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokeListPresenter: PokeListPresenterProtocol {
    
    var view: (PokeListViewProtocol & UIViewController)?
    var router: PokeListRouterProtocol?
    var interactor: PokeListInteractorProtocol?
    var pokemonList: [PokemonItemModel]?
    var pokemonSearchList: [PokemonItemModel]?

    
    init(interactor: PokeListInteractorProtocol, router: PokeListRouterProtocol, view: (PokeListViewProtocol & UIViewController)) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func fetchPokeList() async {
        await self.interactor?.fetchPokeList()
    }
    
    func interactorDidFetchPokeList(with result: Result<PokemonListResponse, Error>) {
        
        switch result {
            case .success(let data):
            self.pokemonList = self.transformToModelList(response: data.results)
            self.pokemonSearchList = pokemonList
            self.view?.showData()
            case .failure(let error):
            print(error)
        }
    }
    
    func pokemonAtIndex(index: Int) -> PokemonItemModel? {
        return self.pokemonList?[index]
    }
    
    func numberOfItems() -> Int {
        return self.pokemonList?.count ?? 0
    }
    
    func searchWithQuery(query: String) {
        self.pokemonList = self.pokemonList?.filter({ $0.name?.range(of: query, options: .caseInsensitive) != nil })
        self.view?.showData()
    }
    
    private func transformToModelList(response: [PokemonItemResponse]?) -> [PokemonItemModel] {
        
        var array = [PokemonItemModel]()
        
        if let response = response {
            for pokemonResponse in response {
                let pokemon = self.transformToModel(response: pokemonResponse)
                array.append(pokemon)
            }
        }
        return array
    }
    
    private func transformToModel(response: PokemonItemResponse) -> PokemonItemModel {
        return PokemonItemModel(name: response.name, url: response.url)
    }
}
