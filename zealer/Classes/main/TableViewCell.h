//
//  TableViewCell.h
//  zealer
//
//  Created by hujiawei on 15/12/2.
//  Copyright © 2015年 hujiawei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "table.h"

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) table *tabData;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
