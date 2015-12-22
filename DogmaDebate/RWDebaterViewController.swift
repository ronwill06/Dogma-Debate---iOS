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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.title = "Debater"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.registerNib( UINib(nibName: "RWDebaterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RWDebaterCollectionViewCell")
        
    }
    
}

extension RWDebaterViewController : UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return debaterViewModel.numberOfLists()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let genericCell = UICollectionViewCell()
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RWDebaterCollectionViewCell", forIndexPath: indexPath) as? RWDebaterCollectionViewCell {
            cell.subjectLabel.text = debaterViewModel.categoryNameAtIndex(indexPath.row)
            return cell
        }
        
        return genericCell
    }
}

extension RWDebaterViewController : UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let viewController = debaterViewModel.viewControllerForIndex(indexPath.row)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
}

extension RWDebaterViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(200.0, 215.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(30, 5, -10, 5)
    }
    
}