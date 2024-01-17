//
//  LoginViewModel.swift
//  MVVM_Okwara
//
//  Created by Nikita Shestakov on 17.01.2024.
//

import UIKit
//3
final class LoginViewModel {
//6
    
    //var error: ObservableObject<String?> = ObservableObject(nil)
    @Published var error: String?
    
    
    func login(email: String, password: String) {
        NetworkService.shared.login(email: email, password: password) { [weak self] success in
            //self?.error.value = success ? nil : "Invalid Credetials!!"
            self?.error = success ? nil : "Invalid Credetials!!"

        }
    }
    
}
