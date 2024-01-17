//
//  NetworkService.swift
//  MVVM_Okwara
//
//  Created by Nikita Shestakov on 17.01.2024.
//

import Foundation
// 5

final class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    private var user: User?
    
    func login(email: String, password: String, complition: @escaping(Bool) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            [weak self ] in
            if email == "123" && password == "123" {
                self?.user = User(firstName: "nik", lastname: "shest", email: "keks@inbox.com", age: 25)
                complition(true)
            } else {
                self?.user = nil
                complition(false)
            }
        }
    }
    
    func geLoggedInUser() -> User {
        return user!
    }
}
