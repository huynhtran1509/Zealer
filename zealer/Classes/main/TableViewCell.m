//
//  TableViewCell.m
//  zealer
//
//  Created by hujiawei on 15/12/2.
//  Copyright © 2015年 hujiawei. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *Img;

@end

@implementation TableViewCell

- (void)setTabData:(table *)tabData
{
    _tabData = tabData;
    
    self.Img.image = [UIImage imageNamed:tabData.name];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
        static NSString *ID = nil;
        if( ID == nil)
        {
            ID = [NSString stringWithFormat:@"%@ID",NSStringFromClass(self)];
            [tableView  registerNib:[UINib nibWithNibName:NSStringFromClass(self) bundle:nil] forCellReuseIdentifier:ID];
        }
    id cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    
    return cell;
}




@end
