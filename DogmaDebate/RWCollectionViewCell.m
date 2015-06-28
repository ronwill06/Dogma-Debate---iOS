//
//  RWCollectionViewCell.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/25/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWCollectionViewCell.h"

@implementation RWCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.layer.borderColor = [[UIColor blackColor] CGColor];
    self.layer.borderWidth = 2.0;
}

@end
