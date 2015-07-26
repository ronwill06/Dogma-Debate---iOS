//
//  RWBlogContent.h
//  DogmaDebate
//
//  Created by Rondale Williams on 7/26/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWBlogContent : NSObject

@property (strong, nonatomic) NSData *blogData;

- (instancetype)initWithData:(NSData *)data;

@end
