//
//  RWBlogContent.m
//  DogmaDebate
//
//  Created by Rondale Williams on 7/26/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWBlogContent.h"

@implementation RWBlogContent

- (instancetype)initWithData:(NSData *)data
{
    self = [super init];
    
    if (self) {
        self.blogData = data;
    }
    
    return self;
}

@end
