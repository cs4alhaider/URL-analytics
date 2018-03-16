//
//  Analytics.swift
//  Easy tools
//
//  Created by Abdullah Alhaider on 3/13/18.
//  Copyright © 2018 Abdullah Alhaider. All rights reserved.
//

import Foundation

struct Analytics : Codable {
    let allTime : AllTime?
    let month : Month?
    let week : Week?
    let day : Day?
    let twoHours : TwoHours?
    
    enum CodingKeys: String, CodingKey {
        
        case allTime
        case month
        case week
        case day
        case twoHours
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        allTime = try AllTime(from: decoder)
        month = try Month(from: decoder)
        week = try Week(from: decoder)
        day = try Day(from: decoder)
        twoHours = try TwoHours(from: decoder)
    }
    
}
