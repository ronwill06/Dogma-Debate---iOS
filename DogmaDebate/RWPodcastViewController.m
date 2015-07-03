//
//  RWPodcastViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 7/2/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWPodcastViewController.h"

@interface RWPodcastViewController ()
@property (weak, nonatomic) IBOutlet UILabel *epsisodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *episodeDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *extraInfoLabel;

@end

@implementation RWPodcastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
}
- (IBAction)fastForwardAudio:(id)sender {
}

- (IBAction)playAudio:(id)sender {
}

- (IBAction)rewindAudio:(id)sender {
    
}


@end
