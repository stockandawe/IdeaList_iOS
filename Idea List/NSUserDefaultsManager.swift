//
//  NSUserDefaultsManager.swift
//  Idea List
//
//  Created by Rutul Dave on 10/1/15.
//  Copyright © 2015 Rutul Dave. All rights reserved.
//

import UIKit

class NSUserDefaultsManager: NSObject {
    static let userDefault = NSUserDefaults.standardUserDefaults()
    
    class func synchronize() {
        let myData = NSKeyedArchiver.archivedDataWithRootObject(IdeaManager.ideas)
        NSUserDefaults.standardUserDefaults().setObject(myData, forKey: "ideasarray")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func initializeDefault() {
        if let ideasRaw = NSUserDefaults.standardUserDefaults().dataForKey("ideasarray") {
            if let ideas = NSKeyedUnarchiver.unarchiveObjectWithData(ideasRaw) as? [Idea] {
                IdeaManager.ideas = ideas
            }
        }
    }
}
