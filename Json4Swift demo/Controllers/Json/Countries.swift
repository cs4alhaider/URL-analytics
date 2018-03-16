//
//  Countries.swift
//  Easy tools
//
//  Created by Abdullah Alhaider on 3/13/18.
//  Copyright © 2018 Abdullah Alhaider. All rights reserved.
//

import Foundation

struct Countries : Codable {
    let count : String?
    let id : String?
    
    enum CodingKeys: String, CodingKey {
        
        case count = "count"
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(String.self, forKey: .count)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }
    
}
