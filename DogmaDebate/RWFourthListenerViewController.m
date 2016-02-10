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
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
    [super viewDidAppear:animated];
    
    DDFourthListenerOperation *operation = [[DDFourthListenerOperation alloc] init];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RWMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RWMoreTableViewCell"];
    
    return cell;
}

- (IBAction)logout:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
    
}

@end
