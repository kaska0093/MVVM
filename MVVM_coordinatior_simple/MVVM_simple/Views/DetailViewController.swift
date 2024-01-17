//
//  DetailViewController.swift
//  MVVM_simple
//
//  Created by Nikita Shestakov on 16.01.2024.
//

import UIKit

class DetailViewController: UIViewController, StoryBoardable {
    weak var coordinator: AppCoordinator?
    var viewModel: DetailViewModel?
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "detailVC"
        updateUI()
    }
    
    func updateUI() {
        nameLabel.text = viewModel?.model?.name
        cityLabel.text = viewModel?.model?.city
        emailLabel.text = viewModel?.model?.email
        phoneLabel.text = viewModel?.model?.phone
    }
}
