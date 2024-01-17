//
//  MainViewController + TableView.swift
//  SimpleMVVM
//
//  Created by Nikita Shestakov on 14.01.2024.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func registerCell() {
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
    }
    
    //MARK: -UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numbarsOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier,
                                                       for: indexPath) as? MainCell else { return UITableViewCell() }
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataSourse = viewModel.dataSouse else { return }
        presentDetailViewController(user: dataSourse[indexPath.row])
    }
    
    
}
