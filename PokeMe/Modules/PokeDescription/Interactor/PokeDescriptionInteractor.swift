//
//  PokeDescriptionInteractor.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokeDescriptionInteractor: PokeDescriptionInteractorProtocol {

    let service = Service()
    var presenter: PokeDescriptionPresenterProtocol?
    
    func fetchPokeDescription() async {
        
        do {
            let response = try await self.service.getOperation()
            
            if let data = response as? Data {
                let pokemonDescription = try JSONDecoder().decode(PokemonResponse.self, from: data)
                self.presenter?.interactorDidFetchPokeDescription(with: .success(pokemonDescription))
            }
        }
        catch {
            self.presenter?.interactorDidFetchPokeDescription(with: .failure(error))
        }
    }
}
