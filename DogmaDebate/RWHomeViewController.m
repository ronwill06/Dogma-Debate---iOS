//
//  RWHomeViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/15/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWHomeViewController.h"
#import "RWHomeTableViewCell.h"
#import "RWCollectionViewController.h"
#import "RWStore.h"

@protocol RWHomeViewControllerDelegate <NSObject>

-(void)homeViewController:(RWHomeViewController *)viewController switchToCollectionView:(RWCollectionViewController *)collectionView;

@end

@interface RWHomeViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *labelView;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic)RWCollectionViewController *collectionVC;

@end

@implementation RWHomeViewController

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
    
    [[[self navigationController] navigationBar] setHidden:YES];
    [[self tableView] setTableHeaderView:self.headerView];
    
    [[RWStore store] fetchPosts];
    
    self.tabBarController.tabBar.translucent = NO;
    self.tabBarController.tabBar.barStyle = UIBarStyleBlack;
    self.tabBarController.tabBar.backgroundColor = [UIColor blackColor];
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    
    self.labelView.layer.borderWidth = 2.0;
    self.labelView.layer.borderColor = [UIColor blackColor].CGColor;
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"RWHomeTableViewCell" bundle:nil]
           forCellReuseIdentifier:@"RWHomeTableViewCell"];
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RWHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RWHomeTableViewCell"];
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
}

- (void)tabBar:(UITabBar *)tabBar didBeginCustomizingItems:(NSArray *)items
{
    [tabBar setBackgroundColor:[UIColor blackColor]];
}

- (IBAction)switchToCollectionView:(id)sender
{
    RWCollectionViewController *collectionVC = [[RWCollectionViewController alloc] init];
    [[self navigationController] presentViewController:collectionVC animated:YES completion:nil];
}

//- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
//                                  animationControllerForOperation:(UINavigationControllerOperation)operation
//                                               fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
//{
//    
//}

@end
