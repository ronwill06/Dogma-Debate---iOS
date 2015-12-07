//
//  RWBlogViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/24/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWBlogViewController.h"
#import "RWHomeTableViewCell.h"
#import "RWStore.h"
#import "RWStyleControls.h"

@interface RWBlogViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *blogs;

@end

@implementation RWBlogViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"Blog";
         [[self.tabBarController.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"News"]];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [RWStyleControls stylizeSegmentedControl:self.segmentedControl];
    
    [[self tableView] setTableHeaderView:self.headerView];
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"RWHomeTableViewCell" bundle:nil]
           forCellReuseIdentifier:@"RWHomeTableViewCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    __weak RWBlogViewController *weakSelf = self;
   [[RWStore store] fetchBlogsWithCompletion:^(RWBlogContent *content, NSError *error) {
       
    }];
    
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
    return 200;
}

@end
