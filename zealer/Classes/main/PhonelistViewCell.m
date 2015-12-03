//
//  PhonelistViewCell.m
//  zealer
//
//  Created by hujiawei on 15/12/2.
//  Copyright © 2015年 hujiawei. All rights reserved.
//

#import "PhonelistViewCell.h"

@interface PhonelistViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *phonePic;
@property (weak, nonatomic) IBOutlet UILabel *phoneName;
@property (weak, nonatomic) IBOutlet UILabel *phonePrice;
@end

@implementation PhonelistViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setImgforCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *phonePic = [NSArray arrayWithObjects:
                          @"iphone1",
                          @"iphone2",
                          @"iphone3",
                          @"iphone4",
                          @"iphone5",
                          @"iphone6",
                          @"iphone7",
                           nil];
    NSArray *phoneName = [NSArray arrayWithObjects:
                          @"iPhone 6 Plus",
                          @"iPhone 6",
                          @"iPhon5 5s",
                          @"iPhone 5c",
                          @"iPhone 5",
                          @"iPhone 4s",
                          nil];
    NSArray *phonePrice = [NSArray arrayWithObjects:
                           @"￥4299.00 起",
                           @"￥3999.00 起",
                           @"￥2099.00 起",
                           @"￥1399.00 起",
                           @"￥1599.00 起",
                           @"￥999.00 起",
                           nil];
    if( indexPath.row == 6){
        _phonePic.image = [UIImage imageNamed:@"iphone7"];
        _phoneName.text = @"查看更多";
        _phonePrice.text = @"";
    }else{
        _phonePic.image = [UIImage imageNamed:phonePic[indexPath.row]];
        _phoneName.text = phoneName[indexPath.row];
        _phonePrice.text = phonePrice[indexPath.row];
    }
}

@end
