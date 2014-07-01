//
//  JPDateUtility.h
//  TaskRabbit
//
//  Created by ShiXiong on 14-6-30.
//  Copyright (c) 2014年 junepartner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPDateUtility : NSObject

//将时间戳转化成字符串
+ (NSString *)dateStringByTimeInterval:(NSTimeInterval)timeInterval
                        withDateFormat:(NSString *)dateFormat;

//将时间字符串转化成时间戳
+ (NSTimeInterval)timeIntervalByDateString:(NSString *)dateString
                            withDateFormat:(NSString *)dateFormat;

//类似微博时间
+ (NSString*)timeStampTimeValueForKey:(NSString*)stringTime;

@end
