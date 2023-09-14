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
    
    func fetchPokeDescription(from url: String?) async {
        
        do {
            let response = try await self.service.getOperation(from: url ?? "")
            
            if let data = response as? Data {
                let pokemonDescription = try JSONDecoder().decode(PokemonResponse.self, from: data)
                self.presenter?.interactorDidFetchPokeDescription(with: .success(pokemonDescription))
            }
        }
        catch {
            self.presenter?.interactorDidFetchPokeDescription(with: .failure(error))
        }
    }
    
    func fetchImage(from url: URL) async throws -> UIImage {
        
        if let cachedImage = imageCache.image(for: url) {
            return cachedImage
        }
        
        let data = try await service.downloadImageData(from: url)
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "InvalidImageData", code: 0, userInfo: nil)
        }
        imageCache.cacheImage(image, for: url)
        return image
    }
}
