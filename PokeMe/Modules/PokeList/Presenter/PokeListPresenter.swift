//
//  PokeListPresenter.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokeListPresenter: PokeListPresenterProtocol {
    
    var view: PokeListViewProtocol?
    var router: PokeListRouterProtocol?
    var interactor: PokeListInteractorProtocol?
    var pokemonList: [PokemonModel]?
    var pokemonSearchList: [PokemonModel]?

    init(interactor: PokeListInteractorProtocol, router: PokeListRouterProtocol, view: PokeListViewProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
    //MARK: - Input
    func fetchPokeList(request: PokeListRequest) async {
        await self.interactor?.fetchPokeList(request: request)
    }
    
    
    //MARK: - Output
    func interactorDidFetchPokeList(with result: Result<PokemonListResponse, Error>) {
        
        switch result {
            case .success(let data):
            self.pokemonList = self.transformToModelList(response: data.results)
            self.pokemonSearchList = pokemonList
            self.view?.reloadData()
            case .failure(let error):
            print(error)
        }
    }
    
    func pokemonAtIndex(index: Int) -> PokemonModel? {
        return self.pokemonList?[index]
    }
    
    func numberOfItems() -> Int {
        return self.pokemonList?.count ?? 0
    }
    
    func searchWithQuery(query: String) {
        self.pokemonList = self.pokemonList?.filter({ $0.name?.range(of: query, options: .caseInsensitive) != nil })
        self.view?.reloadData()
    }
    
    
    //MARK: - Transform
    private func transformToModelList(response: [PokemonItemResponse]?) -> [PokemonModel] {
        
        var array = [PokemonModel]()
        
        if let response = response {
            for pokemonResponse in response {
                let pokemon = self.transformToModel(response: pokemonResponse)
                array.append(pokemon)
            }
        }
        return array
    }
    
    private func transformToModel(response: PokemonItemResponse) -> PokemonModel {
        return PokemonModel(name: response.name, url: response.url)
    }
}
