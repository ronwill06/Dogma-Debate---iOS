//
//  RWMoreViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/23/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWMoreViewController.h"
#import "RWMoreTableViewCell.h"

@interface RWMoreViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSArray *options;

@end

@implementation RWMoreViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"More";
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
    self.options =  @[@"our misson", @"contact us", @"partners", @"faq", @"i am 4th", @"atheist audiobooks"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RWMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RWMoreTableViewCell"];
    [[cell cellLabel] setText:[[self options] objectAtIndex:indexPath.row]];
    
    return cell;
}



@end
