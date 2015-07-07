//
//  RWFourthListenerViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 7/3/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWMoreTableViewCell.h"
#import "RWFourthListenerViewController.h"
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [RWStyleControls stylizeSegmentedControl:self.segmentedControl];
    
    [[self tableView] registerNib:[UINib nibWithNibName:@"RWMoreTableViewCell" bundle:nil]
           forCellReuseIdentifier:@"RWMoreTableViewCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = NO;
    
    UIBarButtonItem *rbbi = [[UIBarButtonItem alloc] initWithTitle:@"Log Out"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(logout:)];
    
    [self.navigationItem setRightBarButtonItem:rbbi];

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

- (void)logout:(UIBarButtonItem *)sender
{
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

@end
