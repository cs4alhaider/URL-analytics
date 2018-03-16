//
//  TwoHours.swift
//  Easy tools
//
//  Created by Abdullah Alhaider on 3/13/18.
//  Copyright © 2018 Abdullah Alhaider. All rights reserved.
//

import Foundation

struct TwoHours : Codable {
    let shortUrlClicks : String?
    let longUrlClicks : String?
    let referrers : [Referrers]?
    let countries : [Countries]?
    let browsers : [Browsers]?
    let platforms : [Platforms]?
    
    enum CodingKeys: String, CodingKey {
        
        case shortUrlClicks = "shortUrlClicks"
        case longUrlClicks = "longUrlClicks"
        case referrers = "referrers"
        case countries = "countries"
        case browsers = "browsers"
        case platforms = "platforms"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shortUrlClicks = try values.decodeIfPresent(String.self, forKey: .shortUrlClicks)
        longUrlClicks = try values.decodeIfPresent(String.self, forKey: .longUrlClicks)
        referrers = try values.decodeIfPresent([Referrers].self, forKey: .referrers)
        countries = try values.decodeIfPresent([Countries].self, forKey: .countries)
        browsers = try values.decodeIfPresent([Browsers].self, forKey: .browsers)
        platforms = try values.decodeIfPresent([Platforms].self, forKey: .platforms)
    }
    
}
