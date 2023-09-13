//
//  Service.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/09.
//

import UIKit
import Alamofire

class Service: ServiceProtocol {
    
    func getOperation() async throws -> Any {
        
        return try await withCheckedThrowingContinuation { continuation in
            Session.default.request("https://pokeapi.co/api/v2/pokemon/?limit=100", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
                .response { response in
                    
                    switch response.result {
                    case .success(let data):
                        guard let result = data else {
                            fatalError("Expected non-nil result in the non-error case")
                        }
                        continuation.resume(returning: result)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
    
    
    public static func executeImageDownload(url: URL, completion: @escaping ServiceCompletion) {
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data, error == nil else {
                completion(nil, error?.asAFError)
                return
            }
            completion(data, nil)
        })
        dataTask.resume()
    }
}
