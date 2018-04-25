//
//  DataController.swift
//  swiftforandroid
//
//  Created by Darius Bell on 4/25/18.
//  Copyright © 2018 Darius Bell. All rights reserved.
//

import Foundation
class DataController: NSObject {
    
    let Tanners_Dub_URL = "https://api.myjson.com/bins/1ahrbf"
    var franchises = [String]()
    var objectsReturned = [DataObject]()
    var myfulldata = [[DataObject]]()
    
    func getJsonFromUrl(){
        //creating a NSURL
        let url = NSURL(string: Tanners_Dub_URL)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                if let allDatData = jsonObj!.value(forKey: "datData") as? NSDictionary{
                    print(allDatData)
                    if let franArrary = allDatData.value(forKey: "franchise") as? NSArray {
                        for franchiseDict in franArrary {
                            if let franchiseName = (franchiseDict as! NSDictionary).value(forKey: "franchiseName") as? String{
                                self.franchises.append(franchiseName)
                                
                                if let entriesArray = (franchiseDict as! NSDictionary).value(forKey: "entries") as? NSArray {
                                    self.objectsReturned = []
                                    for entryobj in entriesArray {
                                        let thisEn = DataObject(withObject: entryobj as! Dictionary<String, AnyObject>)
                                        print(thisEn.name)
                                        self.objectsReturned.append(thisEn)
                                    }
                                }
                            }
                            self.myfulldata.append(self.objectsReturned)
                        }
                    }
                    print(self.myfulldata)
                }
                    
                }
            }).resume()
        }
}
