//
//  AppDelegate.m
//  zealer
//
//  Created by hujiawei on 15/11/18.
//  Copyright © 2015年 hujiawei. All rights reserved.
//

#import "AppDelegate.h"
#import "HJWTabbarController.h"
#import "UIImage+GIF.h"

#define screenW [UIScreen mainScreen].bounds.size.width
@interface AppDelegate ()
@property (nonatomic, strong) UIImageView *launchAnimationView;
@property (nonatomic, strong) UIView *view;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    //1.创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //2.创建tabbar控制器将tabbar控制器设置为窗口的根控制器
   
    HJWTabbarController *tabbar = [[HJWTabbarController alloc]init];
    self.window.rootViewController = tabbar;
    
    //3.是窗口可见
    [self.window makeKeyAndVisible];
    
    
    _launchAnimationView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 75, screenW, 260)];
    
    UIImage *gifImage = [UIImage sd_animatedGIFNamed:@"iPhone-6-Crop"];
    _launchAnimationView.image = gifImage;
    
    _view =  [[UIView alloc]initWithFrame:self.window.frame];
     _view.backgroundColor = [UIColor whiteColor];
    [_view addSubview:_launchAnimationView];
    [self.window addSubview:_view];

   
    [UIView animateWithDuration:0.4 delay:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        _launchAnimationView.alpha = 0;
        [self.window bringSubviewToFront:_launchAnimationView];

    } completion:^(BOOL finished) {
        
       
        [_view removeFromSuperview];
    
    }];
    
    
    
    return YES;
}



@end
