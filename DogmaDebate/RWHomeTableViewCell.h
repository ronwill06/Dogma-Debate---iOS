//
//  RWMasterTableViewCell.h
//  DogmaDebate
//
//  Created by Rondale Williams on 6/14/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWHomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *episodeCountLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *episodeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
