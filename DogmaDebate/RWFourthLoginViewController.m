//
//  RWFourthLoginViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 7/3/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWFourthLoginViewController.h"
#import "RWFourthListenerViewController.h"

@interface RWFourthLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *forgotPssswordButton;
@property (weak, nonatomic) IBOutlet UIButton *createAccountButton;

@end

@implementation RWFourthLoginViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
         self.title = @"4th";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

- (IBAction)login:(id)sender
{
    RWFourthListenerViewController *fourthVC = [[RWFourthListenerViewController alloc] init];
    [[self navigationController] pushViewController:fourthVC animated:YES];
    
}


@end
