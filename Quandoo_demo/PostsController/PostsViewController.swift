//
//  PostsViewController.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import UIKit

class PostsViewController: BaseTableContentViewController {
    
    static let Identifier = "PostsViewController"
    
    public var query: PostsQueryModel?
    
    private let viewModel = PostsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        viewModel.loadData(query).done { [weak self] updateUI in
            if updateUI {
                self?.updateUI()
            }
        }.catch { [weak self] (error) in
            self?.updateUI()
        }
    }
    
    private func dataSource() -> [PostModel] {
        return viewModel.posts
    }
}

// MARK: - UITableViewDataSource
extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.Identifier) as! PostCell
        cell.post = viewModel.posts[indexPath.row]
        return cell
    }
}

