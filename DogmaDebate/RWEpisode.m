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
        self.episodeDescriptions = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSString *)audioUrlAtIndexPath:(NSInteger )indexPath
{
    NSString *urlString = [self.episodeStreams objectAtIndex:indexPath];
    
    return urlString;
}

@end
