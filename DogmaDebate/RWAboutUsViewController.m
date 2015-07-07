//
//  RWAboutUsViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 7/3/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWAboutUsViewController.h"
#import "RWAboutUsTableViewCell.h"
#import "RWStaffInfo.h"

@interface RWAboutUsViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) RWStaffInfo *staffInfo;

@end

@implementation RWAboutUsViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.staffInfo = [[RWStaffInfo alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[self tableView] registerNib:[UINib nibWithNibName:@"RWAboutUsTableViewCell" bundle:nil]
           forCellReuseIdentifier:@"RWAboutUsTableViewCell"];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"About Us";
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{ NSForegroundColorAttributeName: [UIColor whiteColor]
                                                                     };

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.staffInfo.staffNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RWAboutUsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RWAboutUsTableViewCell"];
    cell.nameLabel.text = [self.staffInfo.staffNames objectAtIndex:[indexPath row]];
    
    if (![self.staffInfo.staffTwitterNames objectAtIndex:[indexPath row]]) {
        
        cell.twitterButton.hidden = YES;
    }
    
    [cell.twitterButton setTitle:[self.staffInfo.staffTwitterNames objectAtIndex:[indexPath row]] forState:UIControlStateNormal];
    cell.detailTextView.text = [self.staffInfo.staffDetails objectAtIndex:[indexPath row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

@end
