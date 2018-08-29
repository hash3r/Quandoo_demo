//
//  PostsViewModel.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import PromiseKit

class PostsViewModel: PostsViewModelProtocol {
    
    typealias ModelType = PostModel
    typealias QueryModelTypeAssociated = PostsQueryModel
    
    private(set) var posts = [PostModel]()
    private(set) var isLoading = false
    
    func loadData(_ query: PostsQueryModel? = nil) -> Promise<Bool> {
        guard let userId = query?.userId else { return Promise.value(false) }
        
        if (self.isLoading == true) {
            return Promise.value(false)
        }
        self.isLoading = true
        
        let target = PostTarget.postsForUserId(userId)
        
        return Rest.shared.arrayMappableRequest(target).map(on: DispatchQueue.global(),
            { (posts: [PostModel]) -> Bool in
                self.posts = posts
                return posts.count > 0
            }).ensure {
                self.isLoading = false
            }
    }
}

