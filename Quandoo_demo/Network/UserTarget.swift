//
//  UserTarget.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import Alamofire

enum UserTarget {
    case allUsers
}

extension UserTarget: TargetType {
    
    func path() -> PathType {
        switch self {
        case .allUsers: return "/users"
        }
    }
}
