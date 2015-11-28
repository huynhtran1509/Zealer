//
//  PhotoCell.m
//  01-UICollectionView基本使用
//
//  Created by xiaomage on 15/11/26.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@end

@implementation PhotoCell

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    _photoView.image = image;
}

// 从xib加载完成的时候调用
- (void)awakeFromNib {
    // Initialization code
    
    // 设置边框
    [self setValue:(id)[UIColor yellowColor].CGColor forKeyPath:@"layer.borderColor"];
    
    
}

@end
