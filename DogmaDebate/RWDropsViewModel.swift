//
//  RWDropsViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 1/6/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

class RWDropsViewModel {
    
    var drops: [RWDrop] = []
    var clips: [NSString] = []
    
    init() {
        fetchData()
        fetchClips()
    }
    
    func fetchData() {
        let path = NSBundle.mainBundle().pathForResource("sounds", ofType: "plist")
        
        if let path = path {
            let info = NSArray(contentsOfFile:path)
            
            if let dropInfo = info {
                for info in dropInfo {
                    let title = info as? NSString
                    let newTitle = title?.stringByReplacingOccurrencesOfString("\t", withString: "")
                        let drop = RWDrop(title:newTitle)
                        drops.append(drop)
                    
                }
                
            }
        }
        
   }
    
    func fetchClips() {
        
        let path = NSBundle.mainBundle().bundlePath
        let newPath = "/Clips/"
        let clipsPath = NSString(format: "%@%@", path, newPath)
        print("\(NSBundle.mainBundle().resourcePath)")
        _ = NSBundle.mainBundle().pathsForResourcesOfType("mp3", inDirectory: "Clips")
        
        do {
            let clipsFile = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(clipsPath as String)
            for index in 0..<clipsFile.count {
                let clipsURL = NSString(format:"%@%d.mp3", clipsPath, index)
                clips.append(clipsURL)
            }
        } catch {
            
        }
    }
    
    func numberOfItems() -> Int {
        return drops.count
    }
    
    func titleForIndex(index: Int) -> NSString {
        if let title = drops[index].title {
            return title
        }
        return ""
    }
    
    func mp3ForIndex(index: Int) -> NSString {
        let mp3 = clips[index]
        
        return mp3
    }
    
}
