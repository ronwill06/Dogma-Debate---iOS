//
//  RWStore.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/24/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWStore.h"

@interface RWStore ()

@property (strong, nonatomic)NSURLSession *session;

@end

@implementation RWStore

+ (RWStore *)store
{
    static RWStore *store = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        srandom((unsigned)time(NULL));
        
        store = [[RWStore alloc] init];
    });
    
    return store;

}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:config
                                                              delegate:nil
                                                         delegateQueue:nil];
    }
    
    return self;
}

- (void)fetchPosts
{
    
    NSString *spreakerString = @"rtmp://194.116.72.19:80/spreaker-stream-shoutcast";
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:spreakerString]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                
                NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                           options:0
                                                                             error:nil];
                
                NSLog(@"%@", jsonObject);
                
            }] resume];


}

@end
