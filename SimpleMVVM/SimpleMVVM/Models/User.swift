//
//  Users.swift
//  SimpleMVVM
//
//  Created by Nikita Shestakov on 14.01.2024.
//

import Foundation

struct User: Codable {
    let name, username, email: String
    let address: Address
    let phone, website: String
    
}

struct Address: Codable {
    let street, suite, city: String
}
