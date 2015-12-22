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
    var information: String?
    
    init() {
        
    }
    
    convenience init(title: String, information: String) {
        self.init()
        self.title = title
        self.information = information
        
    }
}
