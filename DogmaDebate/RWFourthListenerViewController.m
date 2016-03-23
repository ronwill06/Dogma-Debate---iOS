//
//  RWFourthListenerViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 7/3/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWMoreTableViewCell.h"
#import "RWFourthListenerViewController.h"
#import "DogmaDebate-Swift.h"
#import "RWStyleControls.h"

@interface RWFourthListenerViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) RWFourthListenerViewModel *viewModel;

@end

@implementation RWFourthListenerViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [RWStyleControls stylizeSegmentedControl:self.segmentedControl];
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"RWMoreTableViewCell" bundle:nil]
           forCellReuseIdentifier:@"RWMoreTableViewCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    self.viewModel = [[RWFourthListenerViewModel alloc] init];
    [self.viewModel fetchData];
    self.viewModel.tableView = self.tableView;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.podcastData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RWMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RWMoreTableViewCell"];
    RWPodcast *podcast = [[self.viewModel podcastData] objectAtIndex:indexPath.row];
    cell.cellLabel.text = podcast.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RWPodcastPlayerViewController *podcastPlayerVC = [[RWPodcastPlayerViewController alloc] init];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (IBAction)logout:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
    
}

@end
