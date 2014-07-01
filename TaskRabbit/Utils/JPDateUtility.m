//
//  JPDateUtility.m
//  TaskRabbit
//
//  Created by ShiXiong on 14-6-30.
//  Copyright (c) 2014年 junepartner. All rights reserved.
//

#import "JPDateUtility.h"

@implementation JPDateUtility

/**
 将时间戳转化成字符串
 @params timeInterval   时间戳
 @params dateFormat     时间字符格式
 @returns 时间字符串
 **/
+ (NSString *)dateStringByTimeInterval:(NSTimeInterval)timeInterval
                        withDateFormat:(NSString *)dateFormat
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:dateFormat];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSString *dateString = [df stringFromDate:date];
    return dateString;
}

/**
 将时间字符串转化成时间戳
 @params dateString   时间字符串
 @params dateFormat   时间字符格式
 @returns 时间戳
 **/
+ (NSTimeInterval)timeIntervalByDateString:(NSString *)dateString
                            withDateFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    NSDate *date = [dateFormatter dateFromString:dateString];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return timeInterval;
}

+ (NSString *)time
{
    return @"aa";
}

#pragma mark - Private Method
// 获取时间戳
+ (time_t)getTimeValueForKey:(NSString*)stringTime
                defaultValue:(time_t)_defaultValue
{
    if((id)stringTime == [NSNull null]){
        stringTime = @"";
    }
    //声明时间结构体变量，用于存放有关时间的变量，引自time.h
    struct tm created;
    time_t now;
    time(&now);
    
    if(stringTime){
        //strptime()，按照特定时间格式将字符串转换为时间类型。
        if (strptime([stringTime UTF8String], "%a %b %d %H:%M:%S %z %Y", &created) == NULL){
            strptime([stringTime UTF8String], "%a, %d %b %Y %H:%M:%S %z", &created);
        }
        //创建时间信息返回
        return mktime(&created);
    }
    return _defaultValue;
}

// 获取时间字符串
+ (NSString*)timeStampTimeValueForKey:(NSString*)stringTime
{
    //定一个时间戳字符串对象
    NSString* _timeStamp = @"";
    
    //获取当前具体时间，精确到秒
    time_t now;
    time(&now);
    
    //调用time.h里面的difftime函数计算微博创建时间到现在的时间整数差
    time_t createdAt = [JPDateUtility getTimeValueForKey:stringTime defaultValue:0];
    int distance = (int)difftime(now, createdAt);
    
    //忽略时间误差
    if(distance < 0) {
        distance = 0;
    }
    //根据时间的长短可微博创建时间的长短分为n秒（小时或天或月）前和具体的时间
    if(distance < 60) {
        _timeStamp = [NSString stringWithFormat:@"%d%@",distance,@"秒前"];
    } else if(distance < 60 * 60){
        distance = distance / 60;
        _timeStamp = [NSString stringWithFormat:@"%d%@",distance,@"分钟前"];
    }
    else if(distance < 60 * 60 * 24){
        distance = distance / 60 / 60;
        _timeStamp = [NSString stringWithFormat:@"%d%@",distance,@"小时前"];
    }
    else if(distance < 60 * 60 * 24 * 7){
        distance = distance / 60 / 60 / 24;
        _timeStamp = [NSString stringWithFormat:@"%d%@",distance,@"天前"];
    }
    else if(distance < 60 * 60 * 24 * 7 * 4){
        distance = distance / 60 / 60 / 24 / 7;
        _timeStamp = [NSString stringWithFormat:@"%d%@",distance,@"周前"];
    }
    else{
        //由于每条微博都会创建其发布时间，采用单例来统一格式化时间，节省内存开销
        static NSDateFormatter * dateFormatter = nil;
        if(dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterShortStyle];
            [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        }
        NSDate* date = [NSDate  dateWithTimeIntervalSince1970:createdAt];
        _timeStamp = [dateFormatter stringFromDate:date];
    }
    return _timeStamp;
}

@end
