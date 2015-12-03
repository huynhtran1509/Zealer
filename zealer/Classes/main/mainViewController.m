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
#import "GlobalConst.h"
#import "table.h"
#import "TableViewCell.h"
#import "PhonelistViewCell.h"
#import "PhoneViewController.h"

#define AllScrollH _collectionView.HJW_height + self.scrollView.HJW_height

@interface mainViewController ()<UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *image;
@property (nonatomic, strong) XMGInfiniteScrollView *scrollView ;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UICollectionView  *collectionView;
//@property (nonatomic, strong) UICollectionView  *phoneCollection;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *label;
@property (assign, nonatomic, getter=isScrollDirectionPortrait) BOOL scrollDirectionPortrait;
@property (nonatomic, assign) CGFloat page;
@property (nonatomic, strong) NSArray *table;
@property(nonatomic, strong) PhoneViewController  *phoneView;
@end

@implementation mainViewController

static NSString * const ID = @"cell";
static NSString * const PID = @"cell";
- (NSArray *)table
{
    if (!_table) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"tabpic.plist" ofType:nil];
        NSArray *dicts = [NSArray arrayWithContentsOfFile:filePath];
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:dicts.count];
        
        for (NSDictionary *dict in dicts) {
            table *obj = [table modelWithDict:dict];
            [arrayM addObject: obj];
        }
        _table = arrayM;
    }
    return _table;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"主页";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置主页顶部轮播图
    [self setMainTopImage];

    //设置collectionView
    [self setUpCollectionView];
    
    //设置CollectionView上面的pageController
    [self setUpPageControll];
    
    //设置collectionView上面的label
    [self setUpCollectionLabel];

   
    
    [self setUpTableView];
    [self setUpBottomPhone];
    
    [self.tableView.tableFooterView addSubview:self.phoneView.view];
    [self.tableView.tableHeaderView addSubview:self.scrollView];
    [self.tableView.tableHeaderView addSubview:_collectionView];
    [self.tableView.tableHeaderView addSubview:self.label];
    [self.tableView.tableHeaderView addSubview:self.pageControl];
    
    [self.view addSubview:self.tableView];
    
}




#pragma mark -设置轮播图的pageControll
- (void)setUpPageControll
{
    CGFloat width = 80;
    CGFloat x = _collectionView.center.x - width * 0.5;
    CGFloat y = _collectionView.center.y + _collectionView.bounds.size.width * 0.15;
    CGFloat heigth = 20;
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(x, y, width, heigth)];
    self.pageControl.numberOfPages = 6;
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.hidden = NO;
}

#pragma mark -设置轮播图上面的label
- (void)setUpCollectionLabel
{
    UILabel *label = [[UILabel alloc]init];
    label.HJW_width = 100;
    label.HJW_height = 15;
    label.center = CGPointMake( screenW * 0.5 + 40 , _collectionView.HJW_y + 15);
    label.text = @"12月1日";
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    self.label = label;
}

#pragma mark -设置collectionView
- (void)setUpCollectionView
{
    //设置collectionView的布局
    UICollectionViewFlowLayout *layout = [[FlowLayout alloc] init];
    
    // 设置尺寸
    layout.itemSize = CGSizeMake(200, 100);
    
    // 设置水平滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 计算左边间距
    CGFloat leftMargin = (self.view.bounds.size.width - 200) * 0.5;
    
    // 设置额外滚动区域
    layout.sectionInset = UIEdgeInsetsMake(15, leftMargin, 0, leftMargin);
    
    // 设置cell间距
    //layout.minimumInteritemSpacing = -10;
    layout.minimumLineSpacing = -10;
    
    
    CGFloat MaxY = CGRectGetMaxY(self.scrollView.frame);
    
    //创建Collectionview
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,  MaxY, self.view.bounds.size.width, 145) collectionViewLayout:layout];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    // 设置数据源,展示数据
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
    // 注册cell
    [_collectionView registerNib:[UINib nibWithNibName:@"PhotoCell" bundle:nil] forCellWithReuseIdentifier:ID];
    
    _collectionView.showsHorizontalScrollIndicator = NO;
}

#pragma mark - 添加tableview
- (void)setUpTableView
{
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenW, 1000) style:UITableViewStylePlain];
    self.tableView = tableView;
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    //_oriOffsetY = -(_collectionView.HJW_height + self.scrollView.HJW_height);
    
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 385, 0);

    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, AllScrollH)];
    head.backgroundColor = [UIColor orangeColor];
    self.tableView.tableHeaderView = head;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.rowHeight = 150;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
//    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.sectionHeaderHeight = 5;
    self.tableView.sectionFooterHeight = 5;
    //设置tableview的FooterView
    UIView *foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 200)];
    foot.backgroundColor = [UIColor purpleColor];
    self.tableView.tableFooterView = foot;
}


#pragma mark - tableview数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.table.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    TableViewCell *cell = [TableViewCell  cellWithTableView:tableView];
    table *tb = self.table[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.tabData = tb;
    cell.backgroundColor = HJWBackgroundColor;
    return cell;
}

#pragma mark - 顶部轮播图

//1.设置主页顶部轮播图
- (void)setMainTopImage{
    self.scrollView = [[XMGInfiniteScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 0, screenW, scrollH);
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
}


/*****************************UICollectionViewDataSource*********************************/
#pragma -mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
        PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        NSString *imageName = [NSString stringWithFormat:@"second%ld",indexPath.item + 1];
        cell.image = [UIImage imageNamed:imageName];
        cell.tag = indexPath.item + 1;
        return cell;

}


#pragma mark - UICollection代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 找出最中间的那个图片控件
    NSInteger page = 0;
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i<self.collectionView.subviews.count; i++) {
        UIImageView *imageView = self.collectionView.subviews[i];
        CGFloat distance = 0;
        if (self.isScrollDirectionPortrait) {
            distance = ABS(imageView.frame.origin.y - scrollView.contentOffset.y);
        } else {
            distance = ABS(imageView.frame.origin.x - scrollView.contentOffset.x);
        }
        
        if (distance < minDistance) {
            minDistance = distance;
            page = imageView.tag - 1;
            self.page = page;
        }
        self.pageControl.currentPage = page;
    }
    
}

#pragma mark - 底部手机列表
- (void)setUpBottomPhone
{
    PhoneViewController * phoneView = [[PhoneViewController alloc]init];
    self.phoneView = phoneView;
    
    
}


@end
