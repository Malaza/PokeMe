//
//  PokeDescriptionInteractor.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokeDescriptionInteractor: PokeDescriptionInteractorProtocol {

    private let service = Service()
    private let imageCache = ImageCache()
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
    
//    func fetchImage(from url: URL) async throws -> UIImage {
//        
//        if let cachedImage = imageCache.image(for: url) {
//            return cachedImage
//        }
//        
//        service.downloadImageData(from: url, completion: { data, error in
//            
//            let imageData = data as! Data
//            if let image = UIImage(data: imageData) {
//                imageCache.cacheImage(image, for: url)
//                return image
//            }
//        })
//    }
}
