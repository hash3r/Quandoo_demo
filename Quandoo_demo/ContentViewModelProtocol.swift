//
//  ContentViewModelProtocol.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import Foundation
import PromiseKit

enum ResultAction {
    case update
    case error(Error)
}

/// Protocol represents result view model.
protocol ContentViewModelProtocol {
    associatedtype QueryModelTypeAssociated
    
    /// Progress state
    var isLoading: Bool { get }
    
    /// Method asks for the next chunk of data
    ///
    /// - Returns: promise with a suggestion to update UI
    func loadData(_ query: QueryModelTypeAssociated?) -> Promise<Bool>
}
