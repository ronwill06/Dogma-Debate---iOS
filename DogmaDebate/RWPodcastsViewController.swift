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
    
    var podcastsViewModel: RWPodcastsViewModel? {
        didSet {
            let podcasts = podcastsViewModel?.podcasts
            self.collectionView.reloadData()
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
        
        podcastsViewModel = RWPodcastsViewModel()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.collectionView.registerNib(UINib(nibName: "RWPodcastCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "RWPodcastCollectionViewCell")
    }
    
}

extension RWPodcastsViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (podcastsViewModel?.numberOfItemsInSection())!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RWPodcastCollectionViewCell", forIndexPath: indexPath) as! RWPodcastCollectionViewCell
        if let cellViewModel =  podcastsViewModel?.cellViewModelAtIndex(indexPath.row) {
            cell.cellViewModel = cellViewModel
        }
        
        return cell
    }
}

extension RWPodcastsViewController: UICollectionViewDelegate {
    
}