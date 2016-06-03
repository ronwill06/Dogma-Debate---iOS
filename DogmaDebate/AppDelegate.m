//
//  AppDelegate.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/14/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "AppDelegate.h"
#import "RWMoreViewController.h"
#import "Dogma_Debate-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    RWPodcastsViewController *podCastsVC =  [[RWPodcastsViewController alloc] init];
    UINavigationController *podCastsNavVC = [[UINavigationController alloc] initWithRootViewController:podCastsVC];
    
    RWDebaterViewController *debaterVC = [[RWDebaterViewController alloc] init];
    UINavigationController *debateNavVC = [[UINavigationController alloc] initWithRootViewController:debaterVC];
    debateNavVC.title = @"Debater";
    
    RWSignUpWebViewController *signUpVC = [RWSignUpWebViewController signUpWebViewController];
    UINavigationController *signUpNav = [[UINavigationController alloc] initWithRootViewController:signUpVC];
    
    RWMoreViewController *moreVC = [[RWMoreViewController alloc] init];
    UINavigationController *moreNav = [[UINavigationController alloc] initWithRootViewController:moreVC];


    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.tabBar.translucent = NO;
    tabBarController.tabBar.barTintColor = [UIColor blackColor];
    tabBarController.tabBar.tintColor =  [UIColor whiteColor];
    [tabBarController setViewControllers:@[podCastsNavVC, debateNavVC, signUpNav, moreNav] animated:YES];
    [[tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"PodcastImage"]];
    [[tabBarController.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"Debater"]];
    [[tabBarController.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"Login"]];
    [[tabBarController.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"More"]];
    
    [[self window] setRootViewController:tabBarController];
    
    
    [[self window] makeKeyAndVisible];
    
    DDPodcastOperation *podcastOperation = [[DDPodcastOperation alloc] initWithPage:1];
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:podcastOperation];
    
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    if ([url.host isEqual: @"oauth-swift://login.dogmadebate.com"]) {
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
