//
//  UsersViewModel.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import PromiseKit

class UsersViewModel: ContentViewModel {
    typealias ModelType = UserModel
    
    private(set) var items = [UserModel]()
    private(set) var isLoading = false
    
    func loadData() -> Promise<Bool> {
        if (self.isLoading == true) {
            return Promise.value(false)
        }
        self.isLoading = true

        let target = UserTarget.allUsers
        
        return Promise { seal in

            Rest.shared.arrayMappableRequest(target).map(on: DispatchQueue.global(), { (users: [UserModel]) -> () in
                    self.items = users
                    seal.fulfill(true)
                    self.isLoading = false
                }).catch ({ (error) in
                    seal.reject(error)
                    self.isLoading = false
                })
        }
    }
}

