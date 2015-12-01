//
//  bbsViewController.m
//  zealer
//
//  Created by hujiawei on 15/11/21.
//  Copyright © 2015年 hujiawei. All rights reserved.
//

#import "bbsViewController.h"
#import "XMGInfiniteScrollView.h"

@interface bbsViewController ()

@end

@implementation bbsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"社区";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //self.navigationController.navigationBar.translucent = NO;
    
    XMGInfiniteScrollView *scrollView = [[XMGInfiniteScrollView alloc] init];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    scrollView.frame = CGRectMake(0, 64, width, 145);
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.images = @[
                          [UIImage imageNamed:@"top1"],
                          [UIImage imageNamed:@"top2"]
                          ];
    scrollView.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    scrollView.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    //    scrollView.scrollDirectionPortrait = YES;
    [self.view addSubview:scrollView];
}




@end
