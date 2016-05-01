//
//  UIWidgetCustomizer.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 4/30/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import UIKit

class UIWidgetCustomizer {
    
   static func createRoundedButton(button: UIButton, float: Float) {
        button.layer.cornerRadius = CGFloat(float / 2.0)
    }
    
}
