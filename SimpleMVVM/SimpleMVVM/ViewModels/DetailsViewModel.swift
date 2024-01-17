//
//  DetailsViewModel.swift
//  SimpleMVVM
//
//  Created by Nikita Shestakov on 15.01.2024.
//

import Foundation

class DetailsViewModel {
    
    
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let street: String
    let suite: String
    let city: String
    
    
    init(user: User) {
        self.name = user.name
        self.username =  user.username
        self.email = user.email
        self.phone =  user.phone
        self.website =  user.website
        
        self.street =  user.address.street
        self.suite =  user.address.suite
        self.city =  user.address.city
    }
}
