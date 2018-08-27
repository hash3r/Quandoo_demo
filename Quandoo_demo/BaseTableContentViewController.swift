//
//  BaseTableContentViewController.swift
//  Quandoo_demo
//
//  Created by Vladimir Gnatiuk on 8/28/18.
//  Copyright © 2018 quandoo. All rights reserved.
//

import UIKit

class BaseTableContentViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var noSearchResultsLabel: UILabel!
    
    internal let viewModel = ContentViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
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
    
    private  func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.showsVerticalScrollIndicator = true
    }
    
    private func updateUI() {
        if dataSource().count == 0 {
            noSearchResultsLabel.isHidden = false
            tableView.isHidden = true
        } else {
            noSearchResultsLabel.isHidden = true
            tableView.reloadData()
            tableView.isHidden = false
        }
    }
    
    internal func dataSource() -> [UserModel] {
        return viewModel.users
    }
}

// MARK: - UITableViewDataSource
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource().count
    }
}

