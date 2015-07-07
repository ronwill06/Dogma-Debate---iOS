//
//  RWPartnerViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 7/3/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWPartnerViewController.h"
#import "RWMoreTableViewCell.h"
#import "RWPartner.h"

@interface RWPartnerViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) RWPartner *partner;
@end

@implementation RWPartnerViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.partner = [[RWPartner alloc] init];
         self.navigationItem.title = @"Our Partners";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[self tableView] registerNib:[UINib nibWithNibName:@"RWMoreTableViewCell" bundle:nil]
           forCellReuseIdentifier:@"RWMoreTableViewCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.titleTextAttributes = @{ NSForegroundColorAttributeName: [UIColor whiteColor]
                                                                    };
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.partner.partners.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RWMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RWMoreTableViewCell"];
    cell.cellLabel.text = [self.partner.partners objectAtIndex:[indexPath row]];
    return cell;
}

@end
