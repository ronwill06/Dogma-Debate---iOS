//
//  RWPodcastViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 7/2/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "RWPodcastViewController.h"
#import "Dogma_Debate-Swift.h"

@interface RWPodcastViewController ()

@property (strong, nonatomic) AVPlayer *player;

@end

@implementation RWPodcastViewController

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}


//- (IBAction)playAudio:(id)sender {
//    
//    NSURL *streamURL = [NSURL URLWithString:@""];
//    self.player = [[AVPlayer alloc] initWithURL:streamURL];
//    
//    [self.player addObserver:self forKeyPath:@"status" options:0 context:nil];
//    [self.player play];
//    
//}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.player && [keyPath isEqualToString:@"status"]) {
        if (self.player.status == AVPlayerStatusReadyToPlay) {
            [self.player play];
        }
    }
    
    if (self.player.status == AVPlayerStatusFailed) {
        NSLog(@"No audio");
    }
    
    if (self.player.status == AVPlayerStatusUnknown) {
        NSLog(@"Status unknown");
    }
}

//- (IBAction)rewindAudio:(id)sender {
//    
//}


@end
