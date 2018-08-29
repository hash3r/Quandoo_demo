//
//  BaseTableContentViewController.swift
//  Quandoo_demo
//
//  Created by Vladimir Gnatiuk on 8/28/18.
//  Copyright © 2018 quandoo. All rights reserved.
//

import UIKit

class BaseTableContentViewController: UIViewController {
    
    @IBOutlet internal weak var tableView: UITableView!
    @IBOutlet internal weak var noSearchResultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private  func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.showsVerticalScrollIndicator = true
    }
    
    internal func updateUI(_ error: Error? = nil) {
        if let _ = error {
            noSearchResultsLabel.isHidden = false
            tableView.isHidden = true
        } else {
            noSearchResultsLabel.isHidden = true
            tableView.reloadData()
            tableView.isHidden = false
        }
    }
}


