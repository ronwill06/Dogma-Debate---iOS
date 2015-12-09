//
//  RWCollectionViewController.m
//  DogmaDebate
//
//  Created by Rondale Williams on 6/25/15.
//  Copyright (c) 2015 RondaleWilliams. All rights reserved.
//

#import "RWCollectionViewController.h"
#import "RWCollectionViewCell.h"


@interface RWCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@end

@implementation RWCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CALayer *bottomLayer = [CALayer layer];
    bottomLayer.frame = CGRectMake(0, 44, self.buttonView.bounds.size.width, 2.0);
    bottomLayer.backgroundColor = [[UIColor blackColor] CGColor];
    [self.buttonView.layer addSublayer:bottomLayer];
    
    [[self collectionView] registerNib:[UINib nibWithNibName:@"RWCollectionViewCell" bundle:nil]
            forCellWithReuseIdentifier:@"RWCollectionViewCell"];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RWCollectionViewCell"
                                                                           forIndexPath:indexPath];
    
    return cell;
}

- (IBAction)switchToListView:(id)sender
{
//    RWHomeViewController *homeVC = [[RWHomeViewController alloc] init];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
