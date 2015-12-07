//
//  AppDelegate.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/14/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "AppDelegate.h"
#import "RWHomeViewController.h"
#import "RWEventsViewController.h"
#import "RWBlogViewController.h"
#import "RWFourthLoginViewController.h"
#import "RWMoreViewController.h"
#import "DogmaDebate-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    RWPodcastsViewController *podCastsVC =  [[RWPodcastsViewController alloc] init];
    UINavigationController *podCastsNavVC = [[UINavigationController alloc] initWithRootViewController:podCastsVC];
    
    RWHomeViewController *homeVC = [[RWHomeViewController alloc] init];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    RWEventsViewController *eventsVC = [[RWEventsViewController alloc] init];
    RWBlogViewController *blogVC = [[RWBlogViewController alloc] init];
    
    RWFourthLoginViewController *loginVC = [[RWFourthLoginViewController alloc] init];
    UINavigationController *fourthNav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    
    RWMoreViewController *moreVC = [[RWMoreViewController alloc] init];
    UINavigationController *moreNav = [[UINavigationController alloc] initWithRootViewController:moreVC];


    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[navVC, eventsVC, blogVC, fourthNav, moreNav] animated:YES];
    [[tabBarController.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"News"]];
    [[tabBarController.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"Login"]];
    
    [[self window] setRootViewController:tabBarController];
    
    
    [[self window] makeKeyAndVisible];
    
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
