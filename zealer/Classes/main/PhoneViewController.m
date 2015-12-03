//
//  PhoneViewController.m
//  zealer
//
//  Created by hujiawei on 15/12/3.
//  Copyright © 2015年 hujiawei. All rights reserved.
//

#import "PhoneViewController.h"

#import "PhonelistViewCell.h"
@interface PhoneViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong) PhonelistViewCell  *pCell;
@end

@implementation PhoneViewController
static NSString * const ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UICollectionViewLayout *layout = [self setUpLayout];
    
    [self setUpCollectionView:layout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UICollectionViewFlowLayout *)setUpLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 127);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    
    return layout;
    
}

- (void)setUpCollectionView:(UICollectionViewLayout *)layout
{
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.backgroundColor = HJWBackgroundColor;

    
    collectionView.delegate = self;
    collectionView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 140);
    [collectionView  registerNib:[UINib nibWithNibName:@"PhonelistViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhonelistViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if(!cell){
        cell = [[PhonelistViewCell alloc]init];
    }
    [cell setImgforCellAtIndexPath:indexPath];
    
    
    return cell;
}


@end
