//
//  User.swift
//  MVVM_simple
//
//  Created by Nikita Shestakov on 15.01.2024.
//

import Foundation
//1. Hачинаем всегда с Модели

struct User {
    let login: String?
    let password: String?
}

extension User {
    static var logins = [User(login: "nik", password: "123"),
                         User(login: "niki", password: "1234")]
    
}
