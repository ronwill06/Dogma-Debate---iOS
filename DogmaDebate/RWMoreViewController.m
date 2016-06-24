//
//  RWMoreViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/23/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWMoreViewController.h"
#import "RWMoreTableViewCell.h"
#import "RWAboutUsViewController.h"
#import "RWPartnerViewController.h"
#import "RWFAQViewController.h"
#import <MessageUI/MessageUI.h>

@interface RWMoreViewController ()<UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate>

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
    self.navigationController.navigationBar.hidden = YES;
    self.options =  @[@"about us", @"contact us", @"faq", @"atheist audiobooks"];
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 0) {
        RWAboutUsViewController *aboutVC = [[RWAboutUsViewController alloc] init];
        [[self navigationController] pushViewController:aboutVC animated:YES];
    }
    
    if ([indexPath row] == 1) {
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        mailVC.mailComposeDelegate = self;
        [mailVC setToRecipients:@[@"info@dogmadebate.com"]];
        [self presentViewController:mailVC animated:YES completion:nil];
    }
    
    if ([indexPath row] == 2) {
        RWFAQViewController *faqVC = [[RWFAQViewController alloc] init];
        [[self navigationController] pushViewController:faqVC animated:YES];
    }
    
}


- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if (!error) {
        if (result == MFMailComposeResultCancelled) {
            [controller dismissViewControllerAnimated:YES completion:nil];
        }
    }
}


@end
