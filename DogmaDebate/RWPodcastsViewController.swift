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
    var page = 1
    
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
        navigationController?.navigationBarHidden = true

        if UIDevice.isIphone4() {
            imageViewHeight.constant = 200
        }
        
        
        
        self.collectionView.registerNib(UINib(nibName: "RWPodcastCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "RWPodcastCollectionViewCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        podcastsViewModel?.update = {
            self.collectionView.reloadData()
        }
        
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
        
        guard let count = podcastsViewModel?.numberOfItemsInSection() else { return 0}
        return count

    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RWPodcastCollectionViewCell", forIndexPath: indexPath) as! RWPodcastCollectionViewCell
        let cellViewModel = podcastsViewModel?.cellViewModelAtIndex(indexPath.row)
        cell.cellViewModel = cellViewModel
        
        return cell
    }
}

extension RWPodcastsViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        guard let podcast = podcastsViewModel?.podcastAtIndex(indexPath.row) else { return }
            let podcastPlayerViewController = RWPodcastPlayerViewController(podcast: podcast)
            navigationController?.pushViewController(podcastPlayerViewController, animated: true)
        
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

extension RWPodcastsViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y == scrollView.contentSize.height - scrollView.frame.size.height {
            print("Content Offset:\(scrollView.contentOffset.y)")
            page += 1
            let podcastOp = DDPodcastOperation(page: page)
            let operationQueue = NSOperationQueue()
            operationQueue.addOperation(podcastOp)
            
        }
    }
}