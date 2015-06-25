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
    
    NSURL *baseUrl = [NSURL URLWithString:@"https://public-api.wordpress.com/rest/v1.1/sites/dogmadebate.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:baseUrl];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    
                                                    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                                               options:0
                                                                                                                 error:nil];
                                                    
                                                    NSLog(@"%@", jsonObject);
                                                    
                                                }];
    
    [dataTask resume];

}

@end
