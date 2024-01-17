//
//  ViewController.swift
//  SimpleMVVM
//
//  Created by Nikita Shestakov on 14.01.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 0.7127172351, green: 0.9324371219, blue: 0.7066156268, alpha: 1) // #colorliteral(
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let activityIndicator = UIActivityIndicatorView()
    
    var viewModel = MainViewModel()
    
    var cellDataSource = [MainCellViewModel]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUsers()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
        bindViewModel()
    }
    
    private func setupViews() {
        view.backgroundColor = .red
        title = "Main Screen"

        view.addSubview(tableView)
        setupTableView()
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading else { return }
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        viewModel.cellDataSource.bind { [weak self] users in
            guard let self, let users else { return }
            cellDataSource = users
            reloadTableView()
        }
    }
    
    func presentDetailViewController(user: User) {
        let detailViewModel = DetailsViewModel(user: user)
        let detailViewController = DetailsViewController(detailViewModel: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MainViewController {
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        ])
    }
}

