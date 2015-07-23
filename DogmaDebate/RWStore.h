//
//  RWStore.h
//  DogmaDebate
//
//  Created by Rondale Williams on 6/24/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWStore : NSObject

+ (RWStore *)store;
- (void)fetchPosts;
- (void)fetchEpisodesWithURLWithCompletion:(void(^)(NSDictionary *episodes, NSError *error))block;

@end
