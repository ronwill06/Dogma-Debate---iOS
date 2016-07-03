//
//  AppDelegate.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/14/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "AppDelegate.h"
#import "Backendless.h"
#import "MediaService.h"
#import "RWMoreViewController.h"
#import "Dogma_Debate-Swift.h"

@interface AppDelegate ()


@property (nonatomic) UIImageView *imageView;

@end

@implementation AppDelegate

static NSString *APP_ID = @"26025EF9-3841-460D-FF2A-0AF4DE17FE00";
static NSString *SECRET_KEY = @"2BE4DD47-790B-1FAE-FF3C-41DADE420D00";
static NSString *VERSION_NUM = @"v1";


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Backendless *backendLess = [Backendless sharedInstance];
    [backendLess initApp:APP_ID secret:SECRET_KEY version:VERSION_NUM];
    backendLess.mediaService = [MediaService new];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    StartUpViewController *startUpVC = [[StartUpViewController alloc] init];
    
    UIImage *image = [UIImage imageNamed:@"Splash-Screen-1080-x1920"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    [self.window.superview addSubview: self.imageView];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    RWPodcastsViewController *podcastsVC =  [[RWPodcastsViewController alloc] init];
    RWPodcastsViewModel *podcastsViewModel = [[RWPodcastsViewModel alloc] init];
    podcastsVC.podcastsViewModel = podcastsViewModel;
    UINavigationController *podCastsNavVC = [[UINavigationController alloc] initWithRootViewController:podcastsVC];
    
    RWDebaterViewController *debaterVC = [[RWDebaterViewController alloc] init];
    RWDebaterViewModel *debaterViewModel = [[RWDebaterViewModel alloc] init];
    debaterVC.debaterViewModel = debaterViewModel;
    UINavigationController *debateNavVC = [[UINavigationController alloc] initWithRootViewController:debaterVC];
    debateNavVC.title = @"Debater";
    
    RWFourthLoginViewController *fourthVC = [[RWFourthLoginViewController alloc] init];
    fourthVC.title = @"4th";

    RWSignUpWebViewController *signUpVC = [RWSignUpWebViewController signUpWebViewController];
    UINavigationController *fourthNav = [[UINavigationController alloc] initWithRootViewController:fourthVC];
    
    RWMoreViewController *moreVC = [[RWMoreViewController alloc] init];
    UINavigationController *moreNav = [[UINavigationController alloc] initWithRootViewController:moreVC];


    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.tabBar.translucent = NO;
    tabBarController.tabBar.barTintColor = [UIColor blackColor];
    tabBarController.tabBar.tintColor =  [UIColor whiteColor];
    [tabBarController setViewControllers:@[podCastsNavVC, fourthNav] animated:YES];
    [[tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"PodcastImage"]];
    //[[tabBarController.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"Debater"]];
    [[tabBarController.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"Login"]];
    //[[tabBarController.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"More"]];
    
    [NSTimer scheduledTimerWithTimeInterval:7.0 target:self selector:@selector(removeSplashImage) userInfo:nil repeats:nil];
    
    [[self window] setRootViewController:tabBarController];
    [[self window] makeKeyAndVisible];
    

    
    DDPodcastOperation *podcastOperation = [[DDPodcastOperation alloc] initWithPage:1];
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:podcastOperation];
    
    return YES;
}

- (void)removeSplashImage
{
    [self.imageView removeFromSuperview];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
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
