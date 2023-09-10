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
    
    func fetchPokeList() {
        
        self.service.getOperation(url: Constants.pokemon) { response, error in
            
            guard let data = response as? Data, error == nil else {
//                self.presenter?.interactorDidFetchCurrentWeather(with: .failure(AFError))
//                print(ServiceError.failed.localizedDescription)
                return
            }
            do {
                let responseData =  try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                print(responseData)
//                let weather = try JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
//                self.presenter?.interactorDidFetchCurrentWeather(with: .success(weather))
            }
            catch {
//                self.presenter?.interactorDidFetchCurrentWeather(with: .failure(error))
                print(error.localizedDescription)
            }
            
        }
    }
}
