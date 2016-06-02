//
//  RWPodcastsViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/6/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation
import UIKit

class RWPodcastsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    
    
    
    var podcastsViewModel: RWPodcastsViewModel?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "Podcasts"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.isIphone4() {
            imageViewHeight.constant = 200
        }
        
        podcastsViewModel = RWPodcastsViewModel()
        podcastsViewModel?.collectionViewReference = collectionView
        
        
        self.collectionView.registerNib(UINib(nibName: "RWPodcastCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "RWPodcastCollectionViewCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}

extension RWPodcastsViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = podcastsViewModel?.numberOfItemsInSection() {
            return count
        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RWPodcastCollectionViewCell", forIndexPath: indexPath) as! RWPodcastCollectionViewCell
        if let cellViewModel = podcastsViewModel?.cellViewModelAtIndex(indexPath.row) {
            cell.cellViewModel = cellViewModel
        }
        
        return cell
    }
}

extension RWPodcastsViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let podcast = podcastsViewModel?.podcastAtIndex(indexPath.row) {
            let podcastPlayerViewController = RWPodcastPlayerViewController(podcast: podcast)
            navigationController?.pushViewController(podcastPlayerViewController, animated: true)
        }
        
    }
    
}

extension RWPodcastsViewController: UICollectionViewDelegateFlowLayout {
    
    internal func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if UIDevice.isIphone4() {
            return CGSize(width: view.bounds.size.width, height: 190)
        }
        
        return CGSize(width: view.bounds.size.width, height: 250)
    }
    
}