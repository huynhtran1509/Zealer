//
//  UIImage+Image.m
//  小码哥彩票
//
//  Created by xiaomage on 15/8/25.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
