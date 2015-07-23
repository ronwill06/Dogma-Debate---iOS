//
//  RWPodcastViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 7/2/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "RWPodcastViewController.h"
#import "RWEpisode.h"

@interface RWPodcastViewController ()
@property (weak, nonatomic) IBOutlet UILabel *epsisodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *episodeDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *extraInfoLabel;

@property (strong, nonatomic) AVPlayer *player;

@property (strong, nonatomic) RWEpisode *episode;

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
    
    NSURL *streamURL = [NSURL URLWithString:@"https://api.spreaker.com/download/episode/6165097/185_is_hell_really_in_the_bible.mp3"];
    self.player = [[AVPlayer alloc] initWithURL:streamURL];
    
    [self.player addObserver:self forKeyPath:@"status" options:0 context:nil];
    [self.player play];
    
}

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

- (IBAction)rewindAudio:(id)sender {
    
}


@end
