//
//  Idea.swift
//  Idea List
//
//  Created by Rutul Dave on 9/30/15.
//  Copyright © 2015 Rutul Dave. All rights reserved.
//

import UIKit

class Idea: NSObject {
    var title: String?
    var detail: String?
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
    }
    
    override init() {
        super.init()
    }
}
