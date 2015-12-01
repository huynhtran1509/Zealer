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
   
    //设置TabBarItem属性
    [self setTextAttr];
    
    //添加所有的控制器
    [self setUpAllChildViewController];
     
}

//添加所有的控制器
- (void)setUpAllChildViewController
{
    
    [self setChildVc:[[UINavigationController alloc]initWithRootViewController:[[mainViewController alloc]init]] image:@"tab_home" selImage:@"tab_home_pre" title:@"首页"];
    
    [self setChildVc:[[UINavigationController alloc]initWithRootViewController:[[bbsViewController alloc]init]] image:@"tab_shequ" selImage:@"tab_shequ_pre" title:@"社区"];
    
    [self setChildVc:[[meViewController alloc]init] image:@"tab_me" selImage:@"tab_me_pre" title:@"我"];
}
    
//添加一个子控制器
- (void)setChildVc:(UIViewController *)ChildVc image:(NSString *)image selImage:(NSString *)selImage title:(NSString *)title{


    ChildVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ChildVc.tabBarItem.selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ChildVc.title = title;
    
    [self addChildViewController:ChildVc];

}

//设置TabBarItem属性
- (void)setTextAttr{
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}forState:UIControlStateNormal];
}


@end
