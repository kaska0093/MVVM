//
//  MainViewController.swift
//  MVVM_simple
//
//  Created by Nikita Shestakov on 16.01.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var coordinates: AppCoordinator?
    var viewModel: MainViewModel?
    
    var mailLabel: UILabel = {
       var label = UILabel()
        return label
    }()
    
    private lazy var button: UIButton = {
       var button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 80)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitle("show detail", for: .normal)
        button.addTarget(self, action: #selector(aboutButtonPressed), for: .touchUpInside)
        return button
    }()

    
    @objc func aboutButtonPressed() {
        coordinates?.showDetail()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        
        view.backgroundColor = . green
        title = "MainVC"
        
        mailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mailLabel)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        mailLabel.text = "Hello \(viewModel?.login ?? "default")"
    }
}

extension MainViewController {
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            mailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            mailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: mailLabel.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
