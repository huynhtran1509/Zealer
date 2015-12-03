//
//  table.h
//  zealer
//
//  Created by hujiawei on 15/12/2.
//  Copyright © 2015年 hujiawei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface table : NSObject

@property (nonatomic ,strong) NSString * name;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
