//
//  JPDataUtility.m
//  TaskRabbit
//
//  Created by xiangming on 14-7-2.
//  Copyright (c) 2014年 JunePartner. All rights reserved.
//

//
//  YCDataUtility.m
//  TaskRabbit
//
//  Created by ShiXiong on 14-6-30.
//  Copyright (c) 2014年 junepartner. All rights reserved.
//

#import "JPDataUtility.h"

#define ALPHA           @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define NUMBERS         @"0123456789"
#define ALPHANUM        @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
#define CARDID          @"0123456789Xx"
#define ALLCHAR         @""

@implementation JPDataUtility

/**
 验证手机号是否合法
 @params phoneNumber 手机号
 @returns 手机号有效返回YES
 **/
+ (BOOL)isPhoneNumberValid:(NSString *)phoneNumber
{
    NSString *regex = @"(13[0-9]|14[0-9]|15[0-9]|16[0-9]|18[0-9])\\d{8}";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if ([phoneNumber length] >= 11) {
        id object = [phoneNumber substringFromIndex:[phoneNumber length] - 11];
        return [mobileTest evaluateWithObject:object];
    } else {
        return [mobileTest evaluateWithObject:phoneNumber];
    }
}

/**
 验证字符是否符合规则
 @params text 手机号
 @params
 @returns 手机号有效返回YES
 **/
+ (BOOL)verifyText:(NSString *)text satisfyRule:(JPTextRuleType)ruleType
{
    NSString *ruleString = @"";
    switch (ruleType) {
        case 1:
            ruleString = ALPHA;
            break;
        case 2:
            ruleString = NUMBERS;
            break;
        case 3:
            ruleString = CARDID;
            break;
        default:
            ruleString = ALPHANUM;
            break;
    }
    
    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:ruleString] invertedSet];
    NSArray *stringList = [text componentsSeparatedByCharactersInSet:cs];
    NSString *filtered = [stringList componentsJoinedByString:@""];
    BOOL basicTest = [text isEqualToString:filtered];
    return basicTest;
}

/**
 获取中英文混合字符串长度
 @params strtemp 中英文混合字符串
 @returns 中英文混合字符串长度
 **/
+ (NSInteger)convertToCountWithString:(NSString*)string
{
    float length = 0;
    NSString * tempString = string;
    for (int i = 0; i < [tempString length]; i++) {
        NSString * stt = [tempString substringWithRange:NSMakeRange(i, 1)];
        if ([stt lengthOfBytesUsingEncoding:NSUTF8StringEncoding] == 3) {
            length ++;
        } else {
            length += 1;
        }
    }
    return length;
}

/**
 清除数组中的NSNull对象
 @params array 包含有null对象的数组
 @returns 不包含null对象的数组
 **/
+ (NSArray *)returnArray:(NSArray *)array {
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger index,BOOL *stop){
        if (obj == [NSNull null]) {
            [mutableArray addObject:@""];
        } else if ([obj isKindOfClass:[NSArray class]]) {
            [mutableArray addObject:[JPDataUtility returnArray:array]];
        } else if ([obj isKindOfClass:[NSDictionary class]]) {
            [mutableArray addObject:[JPDataUtility returnDictionary:obj]];
        } else {
            [mutableArray addObject:obj];
        }
    }];
    return mutableArray;
}

/**
 清除字典中的NSNull对象
 @params dictionary 包含有null对象的字典
 @returns 不包含null对象的字典
 **/
+ (NSDictionary *)returnDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] init];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
        if (obj == [NSNull null]) {
            [mutableDictionary setObject:@"" forKey:key];
        } else if ([obj isKindOfClass:[NSArray class]]) {
            [mutableDictionary setObject:[JPDataUtility returnArray:obj]
                                  forKey:key];
        } else if ([obj isKindOfClass:[NSDictionary class]]) {
            [mutableDictionary setObject:[JPDataUtility returnDictionary:obj]
                                  forKey:key];
        } else {
            [mutableDictionary setObject:obj forKey:key];
        }
    }];
    return mutableDictionary;
}

@end