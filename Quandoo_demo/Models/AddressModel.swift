//
//  AddressModel.swift
//  Quandoo_demo
//
//  Created by Hnatiuk, Volodymyr on 27.08.18.
//  Copyright © 2018 Quandoo. All rights reserved.
//

import ObjectMapper

struct AddressModel: Mappable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        street <- map["street"]
        suite <- map["suite"]
        city <- map["city"]
        zipcode <- map["zipcode"]
    }
    
    func fullAddress() -> String? {
        var address = ""
        if let street = street {
            address += street
        }
        if let suite = suite {
            address += (address.count > 0 ? " " : "") + suite
        }
        if let zipcode = zipcode {
            address += (address.count > 0 ? ", " : "") + zipcode
        }
        if let city = city {
            address += (address.count > 0 ? ", " : "") + city
        }
        
        return address
    }
}
