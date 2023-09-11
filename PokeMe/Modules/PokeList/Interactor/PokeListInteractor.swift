//
//  PokeListInteractor.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit
import Alamofire

class PokeListInteractor: PokeListInteractorProtocol {

    let service = Service()
    var presenter: PokeListPresenterProtocol?
    
    func fetchPokeList(request: PokeListRequest) async {
        
        let parameters = request.convertToServiceParameters()
        
        do {
            let response = try await self.service.getOperation(url: request.url, parameters: parameters)
            
            if let data = response as? Data {
                let pokemonList = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                self.presenter?.interactorDidFetchPokeList(with: .success(pokemonList))
            }
        }
        catch {
            self.presenter?.interactorDidFetchPokeList(with: .failure(error))
        }
    }
}
