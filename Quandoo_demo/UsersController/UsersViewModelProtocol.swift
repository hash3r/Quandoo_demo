//
//  UsersViewModelProtocol.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import Foundation

protocol UsersViewModelProtocol: ContentViewModelProtocol {
    associatedtype ModelType
    
    /// Data source
    var users: [ModelType] { get }
}
