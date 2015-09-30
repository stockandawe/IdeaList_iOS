//
//  IdeaManager.swift
//  Idea List
//
//  Created by Rutul Dave on 9/30/15.
//  Copyright © 2015 Rutul Dave. All rights reserved.
//

import UIKit

class IdeaManager: NSObject {
    static var ideas = [Idea]()
    
    // Note: These are class methods, so I can do IdeaManager.AddIdea(), etc.
    class func AddIdea(title: String, detail: String) {
        let idea = Idea(title: title, detail: detail)
        ideas.append(idea)
    }
    
    class func DeleteIdea(id: Int) {
        ideas.removeAtIndex(id)
    }
    
    class func GetIdea(id: Int) -> Idea {
        if (ideas.count > 0) {
            return ideas[id]
        }
        else {
            // return a new empty Idea in case there are no ideas
            return Idea()
        }
    }
}
