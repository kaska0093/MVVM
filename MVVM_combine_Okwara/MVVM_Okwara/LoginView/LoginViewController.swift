//
//  LoginViewController.swift
//  MVVM_Okwara
//
//  Created by Nikita Shestakov on 17.01.2024.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    
    private let viewModel = LoginViewModel()            // 4
    
    private var cancellables: Set<AnyCancellable> = []
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
    }
    
//    private func setupBinders() {                             //8
//        viewModel.error.bind { [weak self] error in
//            if let error = error {
//                print(error)
//            } else {
//                self?.goToHomePage()
//            }
//        }
//    }
    private func setupBinders() {                             //8
        viewModel.$error.sink { [weak self] error in
            if let error = error {
                        print(error)
                    } else {
                        self?.goToHomePage()
                    }
            }.store(in: &cancellables)
        }
    
    func goToHomePage() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(vc, animated: true)
        
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        guard let email = loginTF.text, let password = passwordTF.text else {
            print("input correct login adn password")
            return
        }
        viewModel.login(email: email, password: password)     //7
    }
    
    //отказ от клавиатуры при нажатии на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
