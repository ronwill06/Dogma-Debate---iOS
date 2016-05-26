//
//  RWAtheismObject.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/21/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class RWAtheismObject {

    var title: String?
    var information: NSAttributedString?
    
    init() {
        
    }
    
    convenience init(title: String, information: NSAttributedString) {
        self.init()
        self.title = title
        self.information = information
        
    }
}
