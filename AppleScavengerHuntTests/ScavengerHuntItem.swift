//
//  ScavengerHuntItem.swift
//  AppleScavengerHunt
//
//  Created by Todd Littlejohn on 2/4/16.
//  Copyright © 2016 Todd Littlejohn. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject, NSCoding  {
    
    let name:String
    var photo:UIImage?
    
    // Serialization Keys
    let nameKey = "name"
    let photoKey = "photo"
    
    var completed:Bool {
        get {
            return photo != nil
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey: photoKey)
        }
    }
    
    required init?(coder aDecoder: NSCoder){
        name = aDecoder.decodeObjectForKey(nameKey) as! String
        photo = aDecoder.decodeObjectForKey(photoKey) as? UIImage
    }
    
    init(name: String) {
        self.name = name
    }

}