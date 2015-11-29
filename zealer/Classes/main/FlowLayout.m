//
//  FlowLayout.m
//  01-UICollectionView基本使用
//
//  Created by xiaomage on 15/11/26.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "FlowLayout.h"


/*
    1.只有现在在界面上的cell才需要进行缩放
    2.拿到显示出来的cell的布局对象
    3.如何拿到显示出来cell的布局对象
 
    4.离中心点最近的cell越大,越远就越小
    5.缩放比例:由cell离中心点距离决定
 */

@implementation FlowLayout


// 指定一个区域就能获取这个区域内所有cell的布局对象
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 获取偏移量
    CGFloat offsetX = self.collectionView.contentOffset.x;
    
    CGFloat w = self.collectionView.bounds.size.width;
    CGFloat h = self.collectionView.bounds.size.height;
    
    // 获取显示区域
    CGRect visiableRect = CGRectMake(offsetX, 0, w, h);
    
    // 获取当前显示区域内所有cell的布局
    NSArray *atts = [super layoutAttributesForElementsInRect:visiableRect];
    
    for (UICollectionViewLayoutAttributes *att in atts) {
        // 拿到当前cell的布局
        // 判断cell离中心点距离
        CGFloat delta = fabs(w * 0.5 - (att.center.x - offsetX));
        
        // 计算比例,离中心点距离越大,缩放
        CGFloat scale = 1.05 - delta / w * 0.5;
        
        att.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return atts;
}

// 每次滚动就重新刷新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

// 确定最终滚动位置
// 手指离开的时候调用
/*
    拿到手指离开的时候,获取当前显示cell的布局
 
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    CGFloat w = self.collectionView.bounds.size.width;
    CGFloat h = self.collectionView.bounds.size.height;

    CGFloat targerX = proposedContentOffset.x;
    
    // 获取当前手指离开区域
    // 获取显示区域
    CGRect visiableRect = CGRectMake(proposedContentOffset.x, 0, w, h);
    // 获取当前显示出来cell布局
    NSArray *atts = [super layoutAttributesForElementsInRect:visiableRect];
    
    // 判断下谁离中心点最近
    
    // 记录下最小离中心点区域
    CGFloat minDelta = MAXFLOAT;
    
    for (UICollectionViewLayoutAttributes *att in atts) {
        // 计算下每个cell离中心点距离
        CGFloat delta = fabs(w * 0.5 - (att.center.x - targerX));
        
        if (delta < fabs(minDelta)) {
            minDelta = w * 0.5 - (att.center.x - targerX);
        }
    }
    
    // 注意:这里应该是-,详情看PPT最后一页
    proposedContentOffset.x -= minDelta;
    
//    NSLog(@"%f",minDelta);
    
    
    
    return proposedContentOffset;
}



@end
