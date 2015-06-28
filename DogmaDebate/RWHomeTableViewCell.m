//
//  RWMasterTableViewCell.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/14/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWHomeTableViewCell.h"

@implementation RWHomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}


- (void)drawRect:(CGRect)rect
{

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor blackColor] setStroke];
    
    CGContextSetLineWidth(context, 2);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 0.5);
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect), 0.5);
    
    CGContextStrokePath(context);
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
