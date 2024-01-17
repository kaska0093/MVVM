//
//  MainCell.swift
//  SimpleMVVM
//
//  Created by Nikita Shestakov on 14.01.2024.
//

import UIKit

class MainCell: UITableViewCell {
    
    static var identifier: String {
        "MainCell"
    }
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private var labelStackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        nameLabel.font = .systemFont(ofSize: 16)
        emailLabel.font = .systemFont(ofSize: 14)
        emailLabel.textColor = .gray
        
        labelStackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel])
        labelStackView.axis = .vertical
        labelStackView.spacing = 2
        labelStackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(labelStackView)
        
        NSLayoutConstraint.activate([
            labelStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    func setupCell(viewModel: MainCellViewModel) {
        nameLabel.text = viewModel.name
        emailLabel.text = viewModel.email
    }
}
