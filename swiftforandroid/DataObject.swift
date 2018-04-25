//
//  DataObject.swift
//  swiftforandroid
//
//  Created by Darius Bell on 4/25/18.
//  Copyright © 2018 Darius Bell. All rights reserved.
//

import Foundation
class DataObject: NSObject {
    var name = String()
    var format = String()
    var yearStart = String()
    var yearEnd: String?
    var episodes: Int!
    var network: String?
    var studio: String?
    var imageurl = String()
    var showDesc = String()
    var showSummary = String()
    var castArray = [Dictionary<String, String>]()
    
    
    convenience init(withObject dictionary: Dictionary<String, AnyObject>) {
        self.init()
        
        name = dictionary["name"] as! String
        format = dictionary["format"] as! String
        yearStart = dictionary["yearStart"] as! String
        if let val = dictionary["yearEnd"] {
            yearEnd = val as? String
        }
        if let val = dictionary["episodes"] {
            episodes = val as? Int
        }
        if let val = dictionary["network"] {
            network = val as? String
        }
        if let val = dictionary["studio"] {
            studio = val as? String
        }
        imageurl = dictionary["imageURL"] as! String
        showDesc = dictionary["description"] as! String
        showSummary = dictionary["summary"] as! String
        castArray = dictionary["starring"] as! [Dictionary<String, String>]
        
        
    }
}
