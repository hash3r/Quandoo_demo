//
//  PostModel.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import ObjectMapper

struct PostModel: Mappable {
    var userId: Int?
    var postId: String?
    var title: String?
    var body: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        userId <- map["userId"]
        postId <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}
