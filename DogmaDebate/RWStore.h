//
//  RWStore.h
//  DogmaDebate
//
//  Created by Rondale Williams on 6/24/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWBlogContent.h"

@interface RWStore : NSObject

+ (RWStore *)store;
- (void)fetchPosts;
- (void)fetchEpisodesWithCompletion:(void(^)(NSDictionary *episodes, NSError *error))block;
- (void)fetchBlogsWithCompletion:(void (^)(RWBlogContent *content, NSError *error))block;

@end
