//
//  RWPodcastCollectionViewCell.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/10/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import UIKit

class RWPodcastCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var descriptionTextView: UITextView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var dataLabel: UILabel?
    @IBOutlet weak var numberLabel: UILabel?
    
    var cellViewModel: RWPodcastCellViewModel? {
        didSet {
            self.descriptionTextView?.text = cellViewModel?.podcastDescription
            self.dataLabel?.text = cellViewModel?.date
            self.numberLabel?.text = cellViewModel?.episodeNumber?.description
            self.titleLabel?.text = cellViewModel?.title
        }
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}