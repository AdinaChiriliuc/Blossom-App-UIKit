//
//  OrdersData.swift
//  Blossom Orders
//
//  Created by Adina Chiriliuc on 16/08/2020.
//  Copyright © 2020 Adina Chiriliuc. All rights reserved.
//

import UIKit

struct OrdersData: Codable {
    
    let customer_id: String
    let description_name: String
    let price: String
    let customer_name: String
    let customer_address: String
    
    enum CodingKeys: String, CodingKey {
        case customer_id
        case description_name
        case price
        case customer_name
        case customer_address
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        customer_id = try values.decode(String.self, forKey: .customer_id)
        
        
        description_name = try values.decode(String.self, forKey: .description_name)
        
        price = try values.decode(String.self, forKey: .price)
        
        customer_name = try values.decode(String.self, forKey: .customer_name)
        customer_address = try values.decode(String.self, forKey: .customer_address)
        
    }
}


struct OrdersDataStore: Codable {
    var orders: [OrdersData]
}


