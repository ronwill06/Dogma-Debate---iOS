//
//  RWEventHeaderView.h
//  DogmaDebate
//
//  Created by Rondale Williams on 6/24/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWEventHeaderView : UITableViewHeaderFooterView
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *pastEventsLabel;

@end
