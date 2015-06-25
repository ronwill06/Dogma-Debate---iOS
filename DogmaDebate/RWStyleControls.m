//
//  RWStyleControls.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/24/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWStyleControls.h"

@implementation RWStyleControls

+ (void)stylizeSegmentedControl:(UISegmentedControl *)control
{
    UIGraphicsBeginImageContext(CGSizeMake(8, 30));
    [[UIColor blackColor] set];
    UIRectFill(CGRectMake(0, 0, 8, 30));
    UIImage *offImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *divImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [[UIColor blackColor] set];
    
    UIRectFill(CGRectMake(0, 0, 8, 30));
    [[UIColor grayColor] set];
    UIRectFill(CGRectMake(1, 26, 6, 4));
    UIImage *onImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    [control setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:14]}
                           forState:UIControlStateHighlighted];
    [control setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:14]}
                           forState:UIControlStateSelected];
    [control setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithWhite:0.9 alpha:1], NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:14]}
                           forState:UIControlStateNormal];
    
    [control setTintColor:[UIColor whiteColor]];
    [control setBackgroundImage:offImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [control setBackgroundImage:onImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [control setBackgroundImage:onImage forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    [control setDividerImage:divImage
         forLeftSegmentState:UIControlStateNormal
           rightSegmentState:UIControlStateNormal
                  barMetrics:UIBarMetricsDefault];
    
}


@end
