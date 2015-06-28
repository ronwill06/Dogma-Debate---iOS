//
//  RWCollectionViewCell.h
//  DogmaDebate
//
//  Created by Rondale Williams on 6/25/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *episodeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *episodeNumberLabel;

@end
