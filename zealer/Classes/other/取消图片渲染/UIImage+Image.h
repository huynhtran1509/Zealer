//
//  UIImage+Image.h
//  小码哥彩票
//
//  Created by xiaomage on 15/8/25.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

// 给定一个不要渲染的图片名称,生成一个最原始的图片
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName;

@end
