//
//  RWAboutUsTableViewCell.h
//  DogmaDebate
//
//  Created by Rondale Williams on 7/3/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWAboutUsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

@end
