//
//  ViewModel.swift
//  MVVM_simple
//
//  Created by Nikita Shestakov on 15.01.2024.
//

import Foundation
import UIKit.UIColor
//2 создаем ViewModel
class LoginViewModel {
    
    var statustext = Dynamic(value: "")
    var statusColor = Dynamic(value: UIColor(.black))
    var isLoggedIn = false 
// 5 create
    
    func userButtonPressed(login: String, password: String) {
        if login != User.logins[0].login || password != User.logins[0].password {
            statustext.value = "Log is failed"
            statusColor.value = UIColor(.red)
            isLoggedIn = false
        } else {
            statustext.value = "Success Logged in"  
            statusColor.value =  UIColor(.green)
            isLoggedIn = true
        }
    }
    
}
