//
//  RWEpisode.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/15/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWEpisode.h"

@implementation RWEpisode

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.episodeTitles = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
