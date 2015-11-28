//
//  HJWTabbarController.m
//  zealer
//
//  Created by hujiawei on 15/11/21.
//  Copyright © 2015年 hujiawei. All rights reserved.
//

#import "HJWTabbarController.h"
#import "mainViewController.h"
#import "bbsViewController.h"
#import "meViewController.h"

@interface HJWTabbarController ()


@end

@implementation HJWTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setTextAttr];
    
    [self setUpAllChildViewController];
     
}

//添加所有的控制器
- (void)setUpAllChildViewController
{
    mainViewController *mainVc = [[mainViewController alloc]init];
    [self setChildVc:mainVc image:@"tab_home" selImage:@"tab_home_pre" title:@"首页"];
    
    
    bbsViewController *bbsVc = [[bbsViewController alloc]init];
    [self setChildVc:bbsVc image:@"tab_shequ" selImage:@"tab_shequ_pre" title:@"社区"];
    
    meViewController *meVc = [[meViewController alloc]init];
    [self setChildVc:meVc image:@"tab_me" selImage:@"tab_me_pre" title:@"我"];
}
    
//添加一个子控制器
- (void)setChildVc:(UIViewController *)vc image:(NSString *)image selImage:(NSString *)selImage title:(NSString *)title{

    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.title = title;
    
    [self addChildViewController:nav];

}


- (void)setTextAttr{
    
    //设置文字属性
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}forState:UIControlStateNormal];
}


@end
