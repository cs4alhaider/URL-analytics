//
//  CITreeViewData.swift
//  CITreeView
//
//  Created by Apple on 24.01.2018.
//  Copyright © 2018 Cenk Işık. All rights reserved.
//

import UIKit

class CITreeViewData {
    
    let name : String
    var children : [CITreeViewData]
    
    init(name : String, children: [CITreeViewData]) {
        self.name = name
        self.children = children
    }
    
    convenience init(name : String) {
        self.init(name: name, children: [CITreeViewData]())
    }
    
    func addChild(_ child : CITreeViewData) {
        self.children.append(child)
    }
    
    func removeChild(_ child : CITreeViewData) {
        self.children = self.children.filter( {$0 !== child})
    }
}

extension CITreeViewData {
    
    static func getDefaultCITreeViewData() -> [CITreeViewData] {
        
        let parent1 = CITreeViewData(name: "Short URL : \(shortURL ?? "Error!")")
        let parent2 = CITreeViewData(name: "Long URL : \(longURL ?? "Error!")")
        let parent3 = CITreeViewData(name: "Status is : \(status ?? "Error!")")
        let parent4 = CITreeViewData(name: "created in : \(created ?? "Error!")")
        
        
        
        let subChild511 = CITreeViewData(name: "Short URL Clicks : \(shortUrlClicksAllTimes ?? "Error!")")
        let subChild512 = CITreeViewData(name: "Long URL Clicks : \(longUrlClicksAllTimes ?? "Error!")")
        
        let subChild521 = CITreeViewData(name: "Short URL Clicks : \(shortUrlClicksLastMonth ?? "Error!")")
        let subChild522 = CITreeViewData(name: "Long URL Clicks : \(longUrlClicksLastMonth ?? "Error!")")
        
        let subChild531 = CITreeViewData(name: "Short URL Clicks : \(shortUrlClicksLastWeek ?? "Error!")")
        let subChild532 = CITreeViewData(name: "Long URL Clicks : \(longUrlClicksLastWeek ?? "Error!")")
        
        let subChild541 = CITreeViewData(name: "Short URL Clicks : \(shortUrlClicksLastDay ?? "Error!")")
        let subChild542 = CITreeViewData(name: "Long URL Clicks : \(longUrlClicksLastDay ?? "Error!")")
        
        let subChild551 = CITreeViewData(name: "Short URL Clicks : \(shortUrlClicksLastTwoHours ?? "Error!")")
        let subChild552 = CITreeViewData(name: "Long URL Clicks : \(longUrlClicksLastTwoHours ?? "Error!")")
        
        let child51 = CITreeViewData(name: "All Times", children: [subChild511, subChild512])
        let child52 = CITreeViewData(name: "Last Mounth", children: [subChild521, subChild522])
        let child53 = CITreeViewData(name: "Last Week", children: [subChild531, subChild532])
        let child54 = CITreeViewData(name: "Last Day", children: [subChild541, subChild542])
        let child55 = CITreeViewData(name: "Last Two Hours", children: [subChild551, subChild552])
        let parent5 = CITreeViewData(name: "Analytic Data",children:[child51,child52,child53,child54,child55])

        
        return [parent1,parent2,parent3,parent4,parent5]
    }
}
