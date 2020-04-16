//
//  Item.swift
//  Radioactivity
//
//  Created by PJ Solomon on 2/25/20.
//  Copyright © 2020 pjsolomon. All rights reserved.
//

import UIKit
    class Item: NSObject, NSCoding {
        
        var name: String
        var frequency: String
        var location: String?
        let dateCreated: Date

    init(name: String, location: String?, frequency: String) {
        self.name = name
        self.frequency = frequency
        self.location = location
        self.dateCreated = Date()
        super.init()
     }
        
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        frequency = aDecoder.decodeObject(forKey: "frequency1") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        location = aDecoder.decodeObject(forKey: "location") as! String?
        
        super.init()
    }
        
    convenience init(createValue: Int) {
        if createValue == 0 {
    
            /*
            let prefix = ["WR", "KM", "WB"]
            let suffix = ["UV", "XX", "LM"]
            let locations = [
                            "Burlington",
                            "Winooski",
                            "Colchester",
                            "Williston",
                            "Essex Junction",
                            "South Hero",
                            "Shelburne",
                            "South Burlington"
                            ]
            
            var idx = arc4random_uniform(UInt32(prefix.count))
            let randomPrefix = prefix[Int(idx)]
            idx = arc4random_uniform(UInt32(suffix.count))
            let randomSuffix = suffix[Int(idx)]
            let randomName = "\(randomPrefix)\(randomSuffix)"
            
            let randomValue = Float(Float((arc4random_uniform(200)) + 880) / 10.0)
            
            idx = arc4random_uniform(UInt32(locations.count))
            let randomLocation = locations[Int(idx)]
            */
            
            self.init(name: "New Station",
            location: "Location",
            frequency: "0.0")
            
        } else {
            
            // Data sourced from radio-locator.com
            let stations = [
                ["WXLU", "88.1", "Peru, NY"],
                ["WVTX", "88.7", "Colchester, VT"],
                ["KEBR", "89.7", "Burlington, VT"],
                ["WRUV", "90.1", "Burlington, VT"],
                ["WOXR", "90.9", "Schuyler Falls, NY"],
                ["WGLY", "91.5", "Bolton, VT"],
                ["WWPV", "92.5", "Colchester, VT"],
                ["WEZF", "92.9", "Burlington, VT"],
                ["WNCS", "93.3", "Burlington, VT"],
                ["WIFY", "93.7", "Addison, VT"],
                ["WXXX", "95.5", "South Burlington, VT"],
                ["WXZO", "96.7", "Willsboro, NY"],
                ["WTNN", "97.5", "Bristol, VT"],
                ["WXMS", "97.8", "Au Sable, NY"],
                ["WOKO", "98.9", "Burlington, VT"],
                ["WBTV", "99.3", "Burlington, VT"],
                ["WBTZ", "99.9", "Plattsburgh, NY"],
                ["WPCV", "101.3","Essex, NY"],
                ["WCVT", "101.7", "Stowe, NY"],
                ["WIXM", "102.3", "Grand Isle, VT"],
                ["WWMP", "103.3", "Waterbury, NY"],
                ["WJKS", "104.3", "Keeseville, NY"],
                ["WNCS", "104.7", "Montpelier, VT"],
                ["WKOL", "105.1", "Plattsburgh, NY"],
                ["WIZN", "106.7", "Vergennes, VT"],
                ["WVPS", "107.9", "Burlington, VT"]
            ]
            
            let items = stations[createValue-1]
            self.init(name: items[0], location: items[2], frequency: items[1])
            
        }
    }
        
        func encode(with aCoder: NSCoder) {
            aCoder.encode(name, forKey: "name")
            aCoder.encode(dateCreated, forKey: "dateCreated")
            aCoder.encode(frequency, forKey: "frequency1")
            aCoder.encode(location, forKey: "location")
        }
        
}
