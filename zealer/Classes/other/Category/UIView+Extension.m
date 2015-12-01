//
//  UIView+Extension.m
//  BaiSi
//
//  Created by hujiawei on 15/11/30.
//  Copyright © 2015年 hujiawei. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (CGFloat)HJW_height
{
    return self.frame.size.height;
}

- (CGFloat)HJW_width
{
   return self.frame.size.width;

}

- (void)setHJW_height:(CGFloat)HJW_height
{
    CGRect frame = self.frame;
    frame.size.height = HJW_height;
    self.frame = frame;
}

- (void)setHJW_width:(CGFloat)HJW_width
{
    CGRect frame = self.frame;
    frame.size.width = HJW_width;
    self.frame = frame;

}

- (CGFloat)HJW_x
{
    return self.frame.origin.x;
}

- (CGFloat)HJW_y
{
    return self.frame.origin.y;
}

- (void)setHJW_x:(CGFloat)HJW_x
{
    CGRect frame = self.frame;
    frame.origin.x = HJW_x;
    self.frame = frame;
}

- (void)setHJW_y:(CGFloat)HJW_y
{
    CGRect frame = self.frame;
    frame.origin.y = HJW_y;
    self.frame = frame;
}
@end
