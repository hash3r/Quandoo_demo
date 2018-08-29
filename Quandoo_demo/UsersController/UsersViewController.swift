//
//  UsersViewController.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import UIKit

class UsersViewController: BaseTableContentViewController {
    
    private let viewModel = UsersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        viewModel.loadData().done { [weak self] updateUI in
            if updateUI {
                self?.updateUI()
            }
        }.catch { [weak self] (error) in
            self?.updateUI()
        }
    }
    
    private func dataSource() -> [UserModel] {
        return viewModel.users
    }
}

// MARK: - UITableViewDataSource
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.Identifier) as! UserCell
        cell.user = viewModel.users[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let postsVC = storyboard.instantiateViewController(withIdentifier: PostsViewController.Identifier) as! PostsViewController
        let userId = viewModel.users[indexPath.row].id
        let query = PostsQueryModel(userId: userId)
        postsVC.query = query
        self.navigationController?.show(postsVC, sender: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

