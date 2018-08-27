//
//  UserCell.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import UIKit


class UserCell: UITableViewCell {
    
    static let Identifier = "UserCell"
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    var user: UserModel? {
        didSet {
            self.configureLabels()
        }
    }
    
    private func configureLabels() {
        guard let user = self.user else { return }
        
        if let name = user.name {
            nameLabel.text = name
        }
        if let username = user.username {
            usernameLabel.text = username
        }
        if let email = user.email {
            emailLabel.text = email
        }
        if let address = user.address?.fullAddress() {
            addressLabel.text = address
        }
    }
}
