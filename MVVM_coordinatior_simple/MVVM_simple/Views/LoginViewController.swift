//
//  ViewController.swift
//  MVVM_simple
//
//  Created by Nikita Shestakov on 15.01.2024.
//

//7 delete sceneDelegate
//  in info.plist delete Application Scene Manifest

import UIKit

class LoginViewController: UIViewController, StoryBoardable {
    var viewModel: LoginViewModel?
    var coordinator: AppCoordinator?
// 5 add outlets and action
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!

    @IBAction func loginButtonPressed(_ sender: UIButton) {
// 6
        guard let viewModel = viewModel else { return }
        viewModel.userButtonPressed(login: loginField.text ?? "",
                                    password: passwordField.text ?? "")
        if viewModel.isLoggedIn {
            coordinator?.isLoggedIn = viewModel.isLoggedIn
            coordinator?.showMain(login: loginField.text ?? "")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindViewModel()
    }
//4
    func bindViewModel() {
        viewModel!.statustext.bind { statusText in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        }
        viewModel!.statusColor.bind { color in
            DispatchQueue.main.async {
                self.statusLabel.textColor = color
            }
        }
    }
}

