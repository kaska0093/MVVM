//
//  MainCellViewModel.swift
//  SimpleMVVM
//
//  Created by Nikita Shestakov on 14.01.2024.
//

import Foundation

class MainCellViewModel {
    var name: String
    var email: String
    
    init(_ user: User) {
        self.name = user.name
        self.email = user.email
    }
}
