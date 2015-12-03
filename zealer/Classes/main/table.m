//
//  table.m
//  zealer
//
//  Created by hujiawei on 15/12/2.
//  Copyright © 2015年 hujiawei. All rights reserved.
//

#import "table.h"

@implementation table

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    table *tab = [[self alloc]init];
    [tab setValuesForKeysWithDictionary:dict];
    return tab;
}
@end
