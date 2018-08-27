//
//  ContentViewModelProtocol.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import Foundation
import PromiseKit

/// Protocol represents result view model.
protocol ContentViewModelProtocol {
    
    associatedtype ModelType
    
    /// Data source
    var items: [ModelType] { get }
    
    /// Progress state
    var isLoading: Bool { get }
    
    /// Method asks for the next chunk of data
    ///
    /// - Returns: promise with a suggestion to update UI
    func loadData() -> Promise<Bool>
}


/// Abstract class for content view model
class ContentViewModel: ContentViewModelProtocol {
    typealias ModelType = AnyObject
    
    var items: [AnyObject]
    
    var isLoading: Bool
    
    /// needs to override
    func loadData() -> Promise<Bool> {
        
    }
}
