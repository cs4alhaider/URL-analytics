//
//  AllURLData.swift
//  Easy tools
//
//  Created by Abdullah Alhaider on 3/13/18.
//  Copyright © 2018 Abdullah Alhaider. All rights reserved.
//

import Foundation

struct AllURLData : Codable {
    let kind : String?
    let id : String?
    let longUrl : String?
    let status : String?
    let created : String?
    let analytics : Analytics?
    
    enum CodingKeys: String, CodingKey {
        
        case kind = "kind"
        case id = "id"
        case longUrl = "longUrl"
        case status = "status"
        case created = "created"
        case analytics
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        longUrl = try values.decodeIfPresent(String.self, forKey: .longUrl)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        created = try values.decodeIfPresent(String.self, forKey: .created)
        analytics = try Analytics(from: decoder)
    }
    
}

