//
//  ItemsManager.swift
//  AppleScavengerHunt
//
//  Created by Todd Littlejohn on 2/4/16.
//  Copyright © 2016 Todd Littlejohn. All rights reserved.
//

import Foundation

class ItemsManager {
    
    var itemsList = [ScavengerHuntItem]()
    
    func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        if let documentsPath = directoryList.first {
            return documentsPath + "/ScavengerHuntItems"
        }
        assertionFailure("Could not determine where to save.")
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(itemsList,
                toFile:  theArchivePath) {
                print("Saved sucessfully.")
            } else {
                assertionFailure("Could not save file.")
            }
        }
    }
    
    init() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                itemsList = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [ScavengerHuntItem]
            }
        }
    }
    
    
}