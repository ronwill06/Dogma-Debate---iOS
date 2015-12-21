//
//  RWDebaterViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/20/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation
import UIKit

class RWDebaterViewController : UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let debaterViewModel = RWDebaterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Debater"
        
        collectionView.registerNib( UINib(nibName: "RWDebaterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RWDebaterCollectionViewCell")
        
    }
    
}

extension RWDebaterViewController : UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return debaterViewModel.numberOfLists()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RWDebaterCollectionViewCell", forIndexPath: indexPath) as? RWDebaterCollectionViewCell
        cell?.subjectLabel.text = debaterViewModel.catergoryAtIndex(indexPath.row)
        return cell!
    }
}

extension RWDebaterViewController : UICollectionViewDelegate {
    
}