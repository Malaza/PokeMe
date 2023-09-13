//
//  PokeDescriptionPresenter.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokeDescriptionPresenter: PokeDescriptionPresenterProtocol {
    
    var view: (PokeDescriptionViewProtocol & UIViewController)?
    var router: PokeDescriptionRouterProtocol?
    var interactor: PokeDescriptionInteractorProtocol?
    var pokemon: PokemonModel?
    

    init(interactor: PokeDescriptionInteractorProtocol, router: PokeDescriptionRouterProtocol, view: (PokeDescriptionViewProtocol & UIViewController)) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func fetchPokeDescription() async {
        await self.interactor?.fetchPokeDescription()
    }
    
    func pokemonObject() -> PokemonModel? {
        return self.pokemon
    }
    
    func interactorDidFetchPokeDescription(with result: Result<PokemonResponse, Error>) {
        
        switch result {
            case .success(let data):
            self.pokemon = self.transformToModel(response: data)
            self.view?.showData()
            case .failure(let error):
            self.view?.showErrorMessage(message: error.localizedDescription)
        }
    }
    
    private func transformToModel(response: PokemonResponse) -> PokemonModel {
        var model = PokemonModel()
        model.id = response.id
        model.name = response.name
        model.baseExperience = String(response.base_experience ?? 0)
        model.height = String(response.height ?? 0)
        model.isDefault = response.is_default
        model.locationAreaEncounters = response.location_area_encounters
        model.order = String(response.order ?? 0)
        model.spriteUrl = response.sprites?.other?.dream_world?.front_default
        model.weight = String(response.weight ?? 0)
        return model
    }
}
