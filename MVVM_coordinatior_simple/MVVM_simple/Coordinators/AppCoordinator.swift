//
//  AppCoordinator.swift
//  MVVM_simple
//
//  Created by Nikita Shestakov on 16.01.2024.
//

import UIKit
//9

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var isLoggedIn: Bool = false // need false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isLoggedIn {
            showMain(login: User.logins[0].login!)
        } else {
            showLogin()
        }
    }
    
    
    func showLogin() {
        let vc = LoginViewController.createObject()
        vc.coordinator = self
        vc.viewModel = LoginViewModel()
        vc.viewModel?.isLoggedIn = isLoggedIn
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showMain(login: String) { // without Storyboard
        let view = MainViewController()
        let viewModel = MainViewModel()
        viewModel.login = login
        view.coordinates = self
        view.viewModel = viewModel
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(view, animated: true)
    }
    
    func showDetail() {
        let vc = DetailViewController.createObject()
        let viewModel = DetailViewModel()
        viewModel.model = UserData.userData[0]
        vc.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }

}
