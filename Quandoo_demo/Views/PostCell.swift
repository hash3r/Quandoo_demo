//
//  PostCell.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    static let Identifier = "PostCell"

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    var post: PostModel? {
        didSet {
            self.configureLabels()
        }
    }
    
    private func configureLabels() {
        guard let post = self.post else { return }
        
        if let title = post.title {
            titleLabel.text = title
        }
        if let body = post.body {
            bodyLabel.text = body
        }
    }

}
