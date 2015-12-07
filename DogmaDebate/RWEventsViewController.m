//
//  RWEventsViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/24/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWEventsViewController.h"
#import "RWEventTableViewCell.h"
#import "RWEventHeaderView.h"
#import "RWEvent.h"

typedef enum {
    RWEventMonthSectionJanuary,
    RWEventMonthSectionFebruary,
    RWEventMonthSectionMarch,
    RWEventMonthSectionApril,
    RWEventMonthSectionMay,
    RWEventMonthSectionJune,
    RWEventMonthSectionJuly,
    RWEventMonthSectionAugust,
    RWEventMonthSectionSeptember,
    RWEventMonthSectionOctober,
    RWEventMonthSectionNovember,
    RWEventMonthSectionDecember,
    RWEventMonthSectionMax
}RWEventMonthSection;

@interface RWEventsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *monthsWithYear;
@property (strong, nonatomic) RWEvent *event;


@end

@implementation RWEventsViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"Schedule";
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.event = [[RWEvent alloc] init];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"RWEventTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"RWEventTableViewCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"RWEventHeaderView" bundle:nil]
forHeaderFooterViewReuseIdentifier:@"RWEventHeaderView"];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (NSArray *)monthsWithYear
{
    NSMutableArray *dates = [[NSMutableArray alloc] init];
    
    NSDate *date = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear fromDate:date];
    
    for (int i=1; i < 13; i++) {
        [comps setMonth:i];
        
        NSDate *newDate = [calendar dateFromComponents:comps];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMMM yyyy"];
        NSString *formattedDate = [dateFormatter stringFromDate:newDate];
        
        [dates addObject:formattedDate];
    }
    //NSLog(@"Dates: %@", dates);
    return [dates copy];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.monthsWithYear.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RWEventHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"RWEventHeaderView"];

    headerView.dateLabel.text = [self.monthsWithYear objectAtIndex:section];
    
    if (section > 0) {
        headerView.pastEventsLabel.hidden = YES;
    }
    
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RWEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RWEventTableViewCell"];
    
    return cell;
}



@end
