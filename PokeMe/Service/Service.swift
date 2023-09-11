//
//  Service.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/09.
//

import UIKit
import Alamofire


class Service: ServiceProtocol {
    
    func getOperation(url: String, parameters: ServiceParameters?) async throws -> Any {
        
        return try await withCheckedThrowingContinuation { continuation in
            Session.default.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil)
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
}
