//
//  PokeDescriptionInteractor.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import Foundation

class PokeDescriptionInteractor: PokeDescriptionInteractorProtocol {

    let service = Service()
    var presenter: PokeDescriptionPresenterProtocol?
    
    func fetchPokeDescription(from url: String) {
        
        self.service.getOperation(from: url, completion: { (data, error) in
            
            if let data = data as? Data, error == nil {
                do {
                    let pokemonList = try JSONDecoder().decode(PokemonResponse.self, from: data)
                    self.presenter?.interactorDidFetchPokeDescription(with: .success(pokemonList))
                }
                catch {
                    self.presenter?.interactorDidFetchPokeDescription(with: .failure(error))
                }
            }
            else {
                self.presenter?.interactorDidFetchPokeDescription(with: .failure(error!))
            }
        })
    }
}
