//
//  JPFileUtility.h
//  TaskRabbit
//
//  Created by ShiXiong on 14-6-30.
//  Copyright (c) 2014年 junepartner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPFileUtility : NSObject

//获取Tmp路径
+ (NSString*)getTmpDirectory;

//获取Library路径
+ (NSString*)getLibraryDirectory;

//获取Documents路径
+ (NSString*)getDocumentsDirectory;

//获取文件路径
+ (NSString*)getPathByDirectory:(NSString *)directory
                    andFileName:(NSString *)fileName;

//创建文件夹
+ (NSString *)createDirectoryPathWithRoot:(NSString *)rootName
                         andDirectoryName:(NSString *)directoryName;

//判断文件是否存在
+ (BOOL)fileExistsAtPath:(NSString*)path;

//删除文件
+ (BOOL)deleteFileAtPath:(NSString*)path;

@end
