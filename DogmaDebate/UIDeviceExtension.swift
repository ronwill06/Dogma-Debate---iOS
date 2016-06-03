//
//  UIDeviceExtension.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 6/2/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

extension UIDevice {
    
    static func isIphone4() -> Bool {
        if UIScreen.mainScreen().bounds.width == 320 {
            return true
        }
        
        return false
    }
    
    static func isIphone6() -> Bool {
        if UIScreen.mainScreen().bounds.width == 375 {
            return true
        }
        
        return false
    }
    

    static func isIphone6Plus() -> Bool {
        if UIScreen.mainScreen().bounds.width == 414 {
            return true
        }
        
        return false
    }
    
    
}
