//
//  RWContainerViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/25/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWContainerViewController.h"
#import "RWHomeViewController.h"
#import "RWCollectionViewController.h"

@interface RWContainerViewController ()


@property(strong, nonatomic)RWHomeViewController *homeVC;
@property (strong, nonatomic)RWCollectionViewController *collectionVC;

@end

@implementation RWContainerViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"Home";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.homeVC = [[RWHomeViewController alloc] init];
    [self addChildViewController:self.homeVC];
    [self.view addSubview:self.homeVC.view];
    [self.homeVC didMoveToParentViewController:self];
    
}

- (void)switchToViewController:(RWHomeViewController *)viewController toViewController:(RWCollectionViewController *)otherViewController
{
    [viewController willMoveToParentViewController:nil];
    
    [self addChildViewController:otherViewController];
    [self.view addSubview:otherViewController.view];
    
    [self transitionFromViewController:viewController
                      toViewController:otherViewController
                              duration:0.2
                               options:0
                            animations:nil
                            completion:^(BOOL finished) {
                                [viewController removeFromParentViewController];
                                [otherViewController didMoveToParentViewController:self];
                            }];
    
}



@end
