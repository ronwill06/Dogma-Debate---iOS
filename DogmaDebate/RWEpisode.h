//
//  RWEpisode.h
//  DogmaDebate
//
//  Created by Rondale Williams on 6/15/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RWEpisode : NSObject
@property (nonatomic, strong) NSArray *episodes;

@property (nonatomic, strong) NSMutableArray *episodeTitles;
@property (nonatomic, strong) NSMutableArray *episodeDescriptions;
@property (nonatomic, strong) NSMutableArray *episodeDates;
@property (nonatomic, strong) NSArray *episodeStreams;
@property (nonatomic, strong) NSArray *episodeImages;
@property (nonatomic, strong) NSString *audioURL;
@property (nonatomic, strong) NSString *episodeTitle;
@property (nonatomic, strong) NSString *episodeDate;
@property (nonatomic, strong) NSString *episodeDescription;
@property (nonatomic, strong) UIImage *episodeImage;


- (instancetype)init;
-(NSString *)audioUrlAtIndexPath:(NSInteger )indexPath;

@end
