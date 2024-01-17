//
//  ViewController.swift
//  MVVM_Okwara
//
//  Created by Nikita Shestakov on 17.01.2024.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    
    private let viewModel = HomeViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
        viewModel.getLoggedInUser()
    }
    
    private func setupBinders() {
//        viewModel.welcomeMessage.bind { [weak self] message in
//            self?.welcomeLbl.text = message
//        }
        viewModel.$welcomeMessage.sink { [weak self] message in
            self?.welcomeLbl.text = message
        }.store(in: &cancellables)
    }


}

