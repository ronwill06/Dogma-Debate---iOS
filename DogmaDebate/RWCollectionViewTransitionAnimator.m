//
//  RWCollectionViewTransitionAnimator.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/28/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWCollectionViewTransitionAnimator.h"
#import "RWCollectionViewController.h"

@interface RWCollectionViewTransitionAnimator ()<UIViewControllerAnimatedTransitioning>

@property (weak, nonatomic) id <UIViewControllerContextTransitioning> transitionContext;

@end

@implementation RWCollectionViewTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;
    
//    UIView *containerView = transitionContext.containerView;
//    RWHomeViewController *fromViewController = (RWHomeViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    RWCollectionViewController *toViewController = (RWCollectionViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIButton *button = fromViewController.collectionViewButton;
    
//    [containerView addSubview:toViewController.view];
    
    
}



@end
