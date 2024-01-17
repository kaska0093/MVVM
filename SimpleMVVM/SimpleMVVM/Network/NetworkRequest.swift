//
//  NetworkRequest.swift
//  SimpleMVVM
//
//  Created by Nikita Shestakov on 14.01.2024.
//

import Foundation

class NetworkRequest {
    static let shared = NetworkRequest()
    private init() {}
    
    func getData(_ complitionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        
        URLSession.shared.request(.users) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    complitionHandler(.failure(.urlError))
                } else {
                    guard let data else { return }
                    complitionHandler(.success(data))
                }
            }
        }
    }
}
