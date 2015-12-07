//
//  RWPodcastViewController.h
//  DogmaDebate
//
//  Created by Rondale Williams on 7/2/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWPodcastViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *episodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *episodeDateLabel;
@property (weak, nonatomic) IBOutlet UITextView *episodeDescriptionView;
@property (weak, nonatomic) IBOutlet UIImageView *episodeImage;

@end
