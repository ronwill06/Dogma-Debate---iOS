//
//  DogmaDebateProtocol.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/8/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

protocol DogmaDebateProtocol {
    var tabBarTitle: String? { get }
    var update: (() -> Void)? { get set}
    
    func fetchData()
}