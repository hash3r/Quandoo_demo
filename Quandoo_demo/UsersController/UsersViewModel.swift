//
//  UsersViewModel.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import PromiseKit

class UsersViewModel: UsersViewModelProtocol {
    
    typealias ModelType = UserModel
    typealias QueryModelTypeAssociated = QueryModelType
    
    private(set) var users = [UserModel]()
    private(set) var isLoading = false
    
    func loadData(_ query: QueryModelType? = nil) -> Promise<Bool> {
        if (self.isLoading == true) {
            return Promise.value(false)
        }
        self.isLoading = true

        let target = UserTarget.allUsers
        
        return Rest.shared.arrayMappableRequest(target).map(on: DispatchQueue.global(),
            { (users: [UserModel]) -> Bool in
                self.users = users
                return users.count > 0
            }).ensure {
                self.isLoading = false
            }
    }
}

