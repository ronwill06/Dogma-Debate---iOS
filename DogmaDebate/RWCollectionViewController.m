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

@end

@implementation RWCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[self collectionView] registerNib:[UINib nibWithNibName:@"RWCollectionViewCell" bundle:nil]
            forCellWithReuseIdentifier:@"RWCollectionViewCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RWCollectionViewCell"
                                                                           forIndexPath:indexPath];
    
    return cell;
}


@end
