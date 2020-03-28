//
//  Item.swift
//  Radioactivity
//
//  Created by PJ Solomon on 2/25/20.
//  Copyright © 2020 pjsolomon. All rights reserved.
//

import UIKit
    class Item: NSObject {
        var name: String
        var frequency: Float
        var location: String?
        let dateCreated: Date

    init(name: String, location: String?, frequency: Float) {
        self.name = name
        self.frequency = frequency
        
        self.location = location
        self.dateCreated = Date()
        super.init()
     }
        
    convenience init(random: Bool = false) {
        if random {
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
            
            self.init(name: randomName,
            location: randomLocation,
            frequency: randomValue)
        } else {
            self.init(name: "", location: nil, frequency: 0.0)
         }
    }
        
}
