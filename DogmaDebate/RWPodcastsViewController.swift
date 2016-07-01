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
    
    var podcastsViewModel: RWPodcastsViewModel? {
        didSet {
            podcastsViewModel?.update = {
                self.collectionView.reloadData()
            }

        }
    }
        
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
        
        collectionView.registerNib(UINib(nibName: "RWPodcastCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "RWPodcastCollectionViewCell")
        collectionView.registerNib(UINib(nibName: "RWLoadMoreCell", bundle: nil),
                                        forCellWithReuseIdentifier: "RWLoadMoreCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func loadMorePodcasts() {
        page += 1
        let podcastOp = DDPodcastOperation(page: self.page)
        let operationQueue = NSOperationQueue()
        operationQueue.addOperation(podcastOp)
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
        guard let podcastCount = podcastsViewModel?.podcasts.count else { return UICollectionViewCell()}
        
        if indexPath.row == podcastCount - 1 {
            let loadCell = collectionView.dequeueReusableCellWithReuseIdentifier("RWLoadMoreCell", forIndexPath: indexPath) as! RWLoadMoreCell
            loadCell.titleLabel.text = podcastsViewModel?.podcasts[indexPath.row] as? String
            return loadCell
        } else {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RWPodcastCollectionViewCell", forIndexPath: indexPath) as! RWPodcastCollectionViewCell
        let cellViewModel = podcastsViewModel?.cellViewModelAtIndex(indexPath.row)
        cell.cellViewModel = cellViewModel as? RWPodcastCellViewModel
        
        return cell
        }
    }
}

extension RWPodcastsViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        guard let podcastsViewModel = podcastsViewModel else { return }
        
        if indexPath.row == podcastsViewModel.numberOfItemsInSection() - 1 {
            loadMorePodcasts()
        }
        
        guard let podcast = podcastsViewModel.podcastAtIndex(indexPath.row) else { return }
            let podcastPlayerViewController = RWPodcastPlayerViewController(podcast: podcast)
            navigationController?.pushViewController(podcastPlayerViewController, animated: true)
    }
    
//    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
//        guard let podcastCount = podcastsViewModel?.podcasts?.count else { return }
//        if indexPath.row == podcastCount - 1 {
//            let cell = collectionView.cellForItemAtIndexPath(indexPath)
//            cell?.backgroundColor = UIColor.grayColor()
//        }
//    }
   
}

extension RWPodcastsViewController: UICollectionViewDelegateFlowLayout {
    
    internal func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
          guard let podcastCount = podcastsViewModel?.podcasts.count else { return  CGSize.zero}
        
        if indexPath.row >= podcastCount - 1 {
            return CGSize(width: view.bounds.size.width, height: 50)
        }
        
        if UIDevice.isIphone4() {
            return CGSize(width: view.bounds.size.width, height: 190)
        }
        
        return CGSize(width: view.bounds.size.width, height: 200)
    }
    
}

extension RWPodcastsViewController : UIScrollViewDelegate {
}