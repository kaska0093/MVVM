//
//  HomeViewModel.swift
//  MVVM_Okwara
//
//  Created by Nikita Shestakov on 17.01.2024.
//

import Foundation

final class HomeViewModel {
    //var welcomeMessage: ObservableObject<String?> = ObservableObject(nil)
    @Published var welcomeMessage: String?

    
    func getLoggedInUser() {
        let user = NetworkService.shared.geLoggedInUser()
        //self.welcomeMessage.value = "Hello \(user.firstName) \(user.lastname)"
        self.welcomeMessage = "Hello \(user.firstName) \(user.lastname)"

    }
}
