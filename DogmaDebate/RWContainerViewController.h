//
//  RWContainerViewController.h
//  DogmaDebate
//
//  Created by Rondale Williams on 6/25/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWHomeViewController.h"
#import "RWCollectionViewController.h"

@interface RWContainerViewController : UIViewController

- (void)switchToViewController:(RWHomeViewController *)viewController toViewController:(RWCollectionViewController *)otherViewController;

@end
