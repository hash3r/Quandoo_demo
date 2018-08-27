//
//  PostTarget.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import Alamofire

enum PostTarget {
    case postsForUserId(Int)
}

extension PostTarget: TargetType {
    
    func path() -> PathType {
        switch self {
        case .postsForUserId(let userId): return "/posts?userId=\(userId)"
        }
    }
}
