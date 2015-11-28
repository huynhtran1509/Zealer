//
//  mainViewController.m
//  zealer
//
//  Created by hujiawei on 14/11/21.
//  Copyright © 2015年 hujiawei. All rights reserved.
//

#import "mainViewController.h"
#import "XMGInfiniteScrollView.h"
#import "PhotoCell.h"

#import "FlowLayout.h"

#define screenW [UIScreen mainScreen].bounds.size.width
#define scrollH 145
#define scrollY 64

@interface mainViewController ()<UICollectionViewDataSource,UITableViewDataSource>

@property (nonatomic, strong) NSArray *image;
@property(nonatomic, strong)XMGInfiniteScrollView *scrollView ;
@property (nonatomic, strong) UIPageControl *pageControl;
@property(nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation mainViewController

static NSString * const ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    //将自动调整scroll设置成No,scroll就不会被挤下去
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor lightGrayColor];
    
   /*****************************设置主页顶部轮播图*********************************/
    //1.设置主页顶部轮播图
    [self setMainTopImage];
   /*****************************设置主页顶部轮播图*********************************/
    
    //self.navigationController.navigationBar.translucent = NO;
    
    
    /*****************************设置中间轮播图*********************************/
    //2.设置中间轮播图
    // 默认滚动方向,垂直
    UICollectionViewFlowLayout *layout = ({
        
        UICollectionViewFlowLayout *layout = [[FlowLayout alloc] init];
        
        // 设置尺寸
        layout.itemSize = CGSizeMake(200, 140);
        
        // 设置水平滚动方向
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        // 计算左边间距
        CGFloat leftMargin = (self.view.bounds.size.width - 160) * 0.5;
        
        // 设置额外滚动区域
        layout.sectionInset = UIEdgeInsetsMake(0, leftMargin, 0, 0);
        
        // 设置cell间距
        //layout.minimumInteritemSpacing = -10;
        layout.minimumLineSpacing = -10;
        
        layout;
        
    });
    
    // 3.创建UICollectionView
    // UICollectionView默认的颜色就是黑色
    CGFloat f = CGRectGetMaxY(self.scrollView.frame);
    _collectionView = ({
        
         self.collectionView =  [[UICollectionView alloc] initWithFrame:CGRectMake(0,  f, self.view.bounds.size.width, 160) collectionViewLayout:layout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
//        collectionView.center = self.view.center;
        
        
        // 设置数据源,展示数据
        _collectionView.dataSource = self;
        
        // 注册cell
        [_collectionView registerNib:[UINib nibWithNibName:@"PhotoCell" bundle:nil] forCellWithReuseIdentifier:ID];
        
        
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        _collectionView;
        
    });
    [self.view addSubview:_collectionView];
    /*****************************设置中间轮播图*********************************/
    
    
    
    /*****************************设置中间轮播图的PageControl*********************************/
    
    CGFloat width = 80;
    CGFloat x = _collectionView.center.x - width * 0.5;
    CGFloat y = _collectionView.center.y + _collectionView.bounds.size.width * 0.17;
    CGFloat heigth = 20;
    
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(x, y, width, heigth)];
    self.pageControl.numberOfPages = 4;
    self.pageControl.currentPage = 3;
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.hidden = NO;
    [self.view addSubview:self.pageControl];
     /*****************************设置中间轮播图的PageControl*********************************/
    
    
    [self addTable];
    [self.view addSubview:self.tableView];
    
}


- (void)addTable{
    self.tableView = [[UITableView alloc]init];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * Index = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Index];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Index];
    }
    return cell;
}

#pragma mark - 轮播图

//1.设置主页顶部轮播图
- (void)setMainTopImage{
    self.scrollView = [[XMGInfiniteScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, scrollY, screenW, scrollH);
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.images = @[
                          [UIImage imageNamed:@"second1"],
                          [UIImage imageNamed:@"second2"],
                          [UIImage imageNamed:@"second3"],
                          [UIImage imageNamed:@"second4"],
                          [UIImage imageNamed:@"second5"]
                          ];
    self.scrollView.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    self.scrollView.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    //    scrollView.scrollDirectionPortrait = YES;
    [self.view addSubview:self.scrollView];

}


/*****************************UICollectionViewDataSource*********************************/
#pragma -mark - UICollectionViewDataSource
// 返回有多少cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

// 返回UICollectionViewCell长的外观
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 创建cell
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];

    NSString *imageName = [NSString stringWithFormat:@"second%ld",indexPath.item + 1];
    cell.image = [UIImage imageNamed:imageName];
    cell.tag = indexPath.item + 1;
    
    return cell;
}
/*****************************UICollectionViewDataSource*********************************/
@end
