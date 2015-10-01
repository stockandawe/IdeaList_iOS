//
//  Idea.swift
//  Idea List
//
//  Created by Rutul Dave on 9/30/15.
//  Copyright © 2015 Rutul Dave. All rights reserved.
//

import UIKit

class Idea: NSObject, NSCoding {
    var title: String?
    var detail: String?
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
    }
    
    override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        if let titleDecoded = aDecoder.decodeObjectForKey("title") as? String {
            title = titleDecoded
        }
        if let detailDecoded = aDecoder.decodeObjectForKey("detail") as? String {
            detail = detailDecoded
        }

    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let titleEncoded = title {
            aCoder.encodeObject(titleEncoded, forKey: "title")
        }
        if let detailEncoded = detail {
            aCoder.encodeObject(detailEncoded, forKey: "detail")
        }

    }
}
