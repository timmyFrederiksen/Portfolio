//
//  LocationHomeModel.swift
//  EPHS
//
//  Created by Jennifer Nelson on 12/19/18.
//  Copyright © 2018 EPHS. All rights reserved.
//

import Foundation

protocol PlacesHomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class PlacesHomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: PlacesHomeModelProtocol!
    
    var data = Data()
    
    let urlPath: String = "http://athena.edenpr.org/~jennnelson/iosapps/locationTable.php"  //this will be changed to the path where service.php lives
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = PlacesModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let name = jsonElement["name"] as? String,
                let subtitle = jsonElement["subtitle"] as? String,
                let information = jsonElement["information"] as? String,
                let directions = jsonElement["directions"] as? String,
                let id = jsonElement["id"] as? String
            {
                
                location.name = name
                location.subtitle = subtitle
                location.information = information
                location.directions = directions
                location.id = id
                
            }
            
            locations.add(location)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
            
        })
    }
    
    
}

