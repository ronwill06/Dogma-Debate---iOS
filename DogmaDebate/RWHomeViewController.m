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
#import "RWPodcastViewController.h"
#import "RWEpisode.h"
#import "RWStore.h"

@protocol RWHomeViewControllerDelegate <NSObject>

-(void)homeViewController:(RWHomeViewController *)viewController switchToCollectionView:(RWCollectionViewController *)collectionView;

@end

@interface RWHomeViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *labelView;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) RWCollectionViewController *collectionVC;
@property (strong, nonatomic) NSDictionary *episodes;
@property (strong, nonatomic) RWEpisode *episodeData;

@end

@implementation RWHomeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"Home";
        self.episodes = [[NSDictionary alloc] init];
        self.episodeData = [[RWEpisode alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self tableView] setTableHeaderView:self.headerView];
    
    self.tabBarController.tabBar.translucent = NO;
    self.tabBarController.tabBar.barStyle = UIBarStyleBlack;
    self.tabBarController.tabBar.backgroundColor = [UIColor blackColor];
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    
    self.labelView.layer.borderWidth = 2.0;
    self.labelView.layer.borderColor = [UIColor blackColor].CGColor;
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"RWHomeTableViewCell" bundle:nil]
           forCellReuseIdentifier:@"RWHomeTableViewCell"];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[[self navigationController] navigationBar] setHidden:YES];

    [self loadData];
    
}

- (void)loadData
{
    NSMutableArray *titles = [[NSMutableArray alloc] init];
    NSMutableArray *descriptions = [[NSMutableArray alloc] init];
    NSMutableArray *dates = [[NSMutableArray alloc] init];
    NSMutableArray *streams = [[NSMutableArray alloc] init];
    [[RWStore store] fetchEpisodesWithURLWithCompletion:^(NSDictionary *episodes, NSError *error) {
        self.episodes = episodes;
        NSLog(@"Episode Data:%@", self.episodes);
        
        NSDictionary  *responseData = [self.episodes objectForKey:@"response"];
        NSDictionary  *pagerData =  [responseData objectForKey:@"pager"];
        NSArray *pagerResults = [pagerData objectForKey:@"results"];
        UIImage *image = nil;
        //This all needs to be moved over to data model
        for (int i=0; i < pagerResults.count; i++) {
            NSDictionary *episodeInfo = [pagerResults objectAtIndex:i];
            
            NSString *title = [episodeInfo objectForKey:@"title"];
            [titles addObject:title];
            
            NSString *description = [episodeInfo objectForKey:@"description"];
            if ([description isEqual:[NSNull null]]) {
                description = @"No show description";
            }
            [descriptions addObject:description];
            
            NSString *date = [episodeInfo objectForKey:@"published_at"];
            NSInteger month = [[date substringWithRange:NSMakeRange(6, 1)] integerValue];
            NSInteger day = [[date substringWithRange:NSMakeRange(8, 2)] integerValue];
            NSInteger year = [[date substringToIndex:4] integerValue];
         
            NSDateComponents *comps = [[NSDateComponents alloc] init];
            [comps setMonth:month];
            [comps setDay:day];
            [comps setYear:year];
            
            NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSDate *compDate = [calendar dateFromComponents:comps];
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateStyle = NSDateFormatterMediumStyle;
            NSString *formattedDate = [dateFormatter stringFromDate:compDate];
            [dates addObject:formattedDate];
            
            NSString *url = [episodeInfo objectForKey:@"download_url"];
            [streams addObject:url];
            
            NSDictionary *imageURLs = [episodeInfo objectForKey:@"image"];
            NSString *imageURLString = [imageURLs objectForKey:@"large_url"];
            NSURL *imageURL = [NSURL URLWithString:imageURLString];
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            image = [UIImage imageWithData:imageData];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.episodeData.episodeTitles = titles;
            self.episodeData.episodeDescriptions = descriptions;
            self.episodeData.episodeDates = dates;
            self.episodeData.episodeStreams = streams;
            self.episodeData.episodeImage = image;
            [[self tableView] reloadData];
        });
        
    }];
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.episodeData.episodeTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RWHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RWHomeTableViewCell"];
    cell.textView.editable = NO;
    NSString *description = [self.episodeData.episodeDescriptions objectAtIndex:[indexPath row]];
    cell.textView.text = description;
    
    NSString *title = [self.episodeData.episodeTitles objectAtIndex:[indexPath row]];
    NSString *number = [title substringWithRange:NSMakeRange(1, 4)];
    cell.episodeTitleLabel.text = title;
    cell.episodeCountLabel.text = number;
    cell.dateLabel.text = [self.episodeData.episodeDates objectAtIndex:[indexPath row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RWPodcastViewController *podCastVC = [[RWPodcastViewController alloc] init];
    podCastVC.episode.audioURL = [self.episodeData audioUrlAtIndexPath:[indexPath row]];
    podCastVC.episode.episodeTitle = [self.episodeData.episodeTitles objectAtIndex:[indexPath row]];
    podCastVC.episode.episodeDate = [self.episodeData.episodeDates objectAtIndex:[indexPath row]];
    podCastVC.episode.episodeDescription = [self.episodeData.episodeDescriptions objectAtIndex:[indexPath row]];
    podCastVC.episode.episodeImage = self.episodeData.episodeImage;
    [[self navigationController] pushViewController:podCastVC animated:YES];
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
