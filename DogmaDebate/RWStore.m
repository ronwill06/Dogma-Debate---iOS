//
//  RWStore.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/24/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWStore.h"
#import "RWBlogContent.h"

NSString * const RWStreamURL = @"https://api.spreaker.com/show/261996/episodes";
NSString * const RWBlogFeedURL = @"";

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
    
    NSString *spreakerString = @"https://api.spreaker.com/user/2500042/shows/author";
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:spreakerString]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                
                NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                           options:0
                                                                             error:nil];
                
                NSLog(@"%@", jsonObject);
                
            }] resume];


}

- (void)fetchEpisodesWithCompletion:(void(^)(NSDictionary *episodes, NSError *error))block
{
    
    [[self.session dataTaskWithURL:[NSURL URLWithString:RWStreamURL]
                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                     
                     NSDictionary *episodes = [NSJSONSerialization JSONObjectWithData:data
                                                                              options:0
                                                                                error:nil];
                     
                     if (block) {
                         block(episodes, nil);
                     } else {
                         block(nil, error);
                     }
                     
                 }] resume];
    
}

- (void)fetchBlogsWithCompletion:(void (^)(RWBlogContent *content, NSError *error))block
{
    [[self.session dataTaskWithURL:[NSURL URLWithString:RWBlogFeedURL]
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    
                    RWBlogContent *blogContent = [[RWBlogContent alloc] initWithData:data];
                    
                    if (block) {
                        block(blogContent, nil);
                    } else {
                        block(nil, error);
                    }
                    
                }] resume];
}



@end
