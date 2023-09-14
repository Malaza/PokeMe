//
//  Service.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/09.
//

import UIKit
import Alamofire

class Service: ServiceProtocol {
    
    func getOperation(from url: String, completion: @escaping ServiceCompletion) {
        
        Session.default.request(url, method: .get, parameters: nil, encoding: URLEncoding.default,
                                headers: nil, interceptor: nil).response { response in
                
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public static func downloadImageData(from url: URL, completion: @escaping ServiceCompletion) {
        
        Session.default.request(url, method: .get, parameters: nil, encoding: URLEncoding.default,
                                headers: nil, interceptor: nil).response { response in
                
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
