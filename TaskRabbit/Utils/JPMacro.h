//
//  JPMacro.h
//  TaskRabbit
//
//  Created by xiangming on 14-7-2.
//  Copyright (c) 2014年 JunePartner. All rights reserved.
//

#ifndef TaskRabbit_JPMacro_h
#define TaskRabbit_JPMacro_h

/**
 *
 * 方法简化名
 *
 **/
#pragma mark - 方法简化名

#define Version                         [[[UIDevice currentDevice] systemVersion] floatValue]       //获取当前设备的版本
#define DefaultValueForKey(key)         [[NSUserDefaults standardUserDefaults] valueForKey:key]     //从defaults中取值
#define SetValueForKey(dic,value,key)   [dic setValue:value forKey:key];                            //给字典设置键值对
#define DoubleToString(x)               [NSString stringWithFormat:@"%f",x]                         //double类型转string类型
#define IntToString(x)                  [NSString stringWithFormat:@"%d",x]                         //int类型转string类型

#define Color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]                //获取颜色的方法
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/**
 *
 * 适配使用的常量
 *
 **/
#pragma mark - 常量

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#define kToolBarHeight  44
#define KStateBarHeight 20
#define kShowAreaHeight kHeight - kToolBarHeight - KStateBarHeight
#define kTabBarHeight   49




/**
 *
 * 保存文件的文件名
 *
 **/
#pragma mark - 保存文件的文件名







/**
 *
 * 保存数据等键/值
 *
 **/
#pragma mark - 保存数据等键/值








/**
 *
 * 通知名称
 *
 **/
#pragma mark- 通知名称











/**
 *
 * 网络数据接口
 *
 **/
#pragma mark - 网络数据接口







#endif
