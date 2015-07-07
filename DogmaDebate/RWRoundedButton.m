//
//  RWRoundedLabelButton.m
//  DogmaDebate
//
//  Created by Rondale Williams on 7/2/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWRoundedButton.h"

@implementation RWRoundedButton

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.layer.cornerRadius = self.cornerSize;
    self.layer.masksToBounds = YES;
}


@end
