//
//  UserModel.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import ObjectMapper

struct UserModel: Mappable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: AddressModel?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
        address <- map["address"]
    }
}
