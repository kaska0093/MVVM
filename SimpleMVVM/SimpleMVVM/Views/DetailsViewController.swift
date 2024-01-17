//
//  DetailsViewController.swift
//  SimpleMVVM
//
//  Created by Nikita Shestakov on 15.01.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let websiteLabel = UILabel()
    private let streetLabel = UILabel()
    private let suiteLabel = UILabel()
    private let cityLabel = UILabel()
    
    private var labelsStackView = UIStackView()
    
    let detailViewModel: DetailsViewModel
    
    init(detailViewModel: DetailsViewModel) {
        self.detailViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        displayUserInfo()
    }
    
    private func setupViews() {
        title = "User Details"
        view.backgroundColor = .blue
        
        labelsStackView = UIStackView(arrangedSubviews: [nameLabel, usernameLabel, emailLabel, phoneLabel, websiteLabel,
                                                        streetLabel, suiteLabel, cityLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 2
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelsStackView)
    }
    
    private func displayUserInfo() {
        nameLabel.text = detailViewModel.name
        usernameLabel.text = detailViewModel.username
        emailLabel.text = detailViewModel.email
        phoneLabel.text = detailViewModel.phone
        websiteLabel.text = detailViewModel.website
        streetLabel.text = detailViewModel.street
        suiteLabel.text = detailViewModel.suite
        cityLabel.text = detailViewModel.city
    }
}

extension DetailsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
