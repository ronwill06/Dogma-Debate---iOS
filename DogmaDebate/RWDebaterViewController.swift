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
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Debater"
        navigationController?.navigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.barStyle = .Black
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)

        collectionView.registerNib(UINib(nibName: "RWDebaterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RWDebaterCollectionViewCell")
        
    }
    
    override func viewWillAppear(animated: Bool) {
      
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
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
        if let navigationController = navigationController {
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
}

extension RWDebaterViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if UIDevice.isIphone4() {
            return CGSizeMake(150.0, 150.0)
        } else if UIDevice.isIphone6() {
            return CGSizeMake(180.0, 175.0)
        }
        
        return CGSizeMake(200.0, 215.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        if UIDevice.isIphone6() {
           return UIEdgeInsetsMake(10, 5, 0, 5)
        }
        
        return UIEdgeInsetsMake(10, 5, -10, 5)
    }
    
}