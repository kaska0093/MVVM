//
//  UserData.swift
//  MVVM_simple
//
//  Created by Nikita Shestakov on 16.01.2024.
//

import Foundation

struct UserData {
    var name: String?
    var city: String?
    var email: String?
    var phone: String?
}

extension UserData {
    static var userData = [UserData(name: "nik", city: "Sochi", email: "keks@inbox.ru", phone: "8-999-605-37-40")]
}
