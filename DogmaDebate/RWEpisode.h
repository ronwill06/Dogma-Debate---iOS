//
//  RWEpisode.h
//  DogmaDebate
//
//  Created by Rondale Williams on 6/15/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWEpisode : NSObject
@property (nonatomic, strong) NSArray *episodes;

@property (nonatomic, strong) NSMutableArray *episodeTitles;
@property (nonatomic, strong) NSMutableArray *episodeDescriptions;
@property (nonatomic, strong) NSMutableArray *episodeDates;
@property (nonatomic, strong) NSDate *episodeDate;
@property (nonatomic, strong) NSArray *episodeStreams;
@property (nonatomic, strong) NSString *audioURL;

- (instancetype)init;
-(NSString *)audioUrlAtIndexPath:(NSInteger )indexPath;

@end
