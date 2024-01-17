//
//  MainViewModel.swift
//  SimpleMVVM
//
//  Created by Nikita Shestakov on 14.01.2024.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(value: false)
    var cellDataSource: Observable<[MainCellViewModel]> = Observable(value: nil)
    var dataSouse: [User]?
    
    func numberOfSection() -> Int {
        1
    }
    func numbarsOfRows(_ section: Int) -> Int {
        dataSouse?.count ?? 0
    }
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchUsers { [weak self] users, error in
            guard let self else { return }
            self.isLoading.value = false
            if error != nil {
                print("error", error?.localizedDescription as Any)
            } else  if let users {
                self.dataSouse = users
                mapCellData()
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSouse?.compactMap({ MainCellViewModel($0)
        })
    }
}
