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
    
    var podCastsViewModel: RWPodcastsViewModel? {
        didSet {
            self.title = podCastsViewModel?.tabBarTitle
        }
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        podCastsViewModel = RWPodcastsViewModel()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.collectionView.registerNib(UINib(nibName: "RWPodcastsCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "RWPodcastsCollectionViewCell")
    }
    
}

extension RWPodcastsViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RWPodcastsCollectionViewCell", forIndexPath: indexPath) as! RWPodcastsCollectionViewCell
        
        return cell
    }
}

extension RWPodcastsViewController: UICollectionViewDelegate {
    
}