//
//  PokeListInteractor.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import Foundation
import Alamofire

class PokeListInteractor: PokeListInteractorProtocol {
    
    let service = Service()
    var presenter: PokeListPresenterProtocol?
    
    func fetchPokeList(from url: String) {
        
        self.service.getOperation(from: url, completion: { (data, error) in
            
            if let data = data as? Data, error == nil {
                
                do {
                    let pokemonList = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                    self.presenter?.interactorDidFetchPokeList(with: .success(pokemonList))
                }
                catch {
                    self.presenter?.interactorDidFetchPokeList(with: .failure(error))
                }
            }
            else {
                self.presenter?.interactorDidFetchPokeList(with: .failure(error!))
            }
        })
    }
}
