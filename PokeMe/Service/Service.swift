//
//  Service.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/09.
//

import UIKit
import Alamofire


class Service: ServiceProtocol {
    
    func getOperation(url: String, parameters: ServiceParameters, completion: @escaping ServiceCompletion) {
        
        Session.default.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { response in
                
                switch response.result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
//    func postOperation(parameters: [String: Any], completion: @escaping ServiceCompletion) {
//        
//        let url = "https://pokeapi.co/api/v2/pokemon"
//        Session.default.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil)
//            .response { response in
//                
//                switch response.result {
//                case .success(let data):
//                    completion(data, nil)
//                case .failure(let error):
//                    completion(nil, error)
//                }
//            }
//    }
}
