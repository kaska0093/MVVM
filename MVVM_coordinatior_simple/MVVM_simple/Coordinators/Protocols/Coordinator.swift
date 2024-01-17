//
//  Coordinator.swift
//  MVVM_simple
//
//  Created by Nikita Shestakov on 16.01.2024.
//

import UIKit
//8
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
