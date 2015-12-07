//
//  RWBlogContent.m
//  DogmaDebate
//
//  Created by Rondale Williams on 7/26/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWBlogContent.h"

@interface RWBlogContent ()<NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableDictionary *item;
@property (nonatomic, strong) NSString *title;

@end


@implementation RWBlogContent

- (instancetype)initWithData:(NSData *)data
{
    self = [super init];
    
    if (self) {
        self.blogData = data;
    }
    
    return self;
}

- (void)loadData
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:self.blogData];
    [parser setDelegate:self];
    [parser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
    attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    if ([elementName isEqualToString:@"title"]) {
        
    }
}



@end
