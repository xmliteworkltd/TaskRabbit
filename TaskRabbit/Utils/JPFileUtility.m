//
//  JPFileUtility.m
//  TaskRabbit
//
//  Created by ShiXiong on 14-6-30.
//  Copyright (c) 2014年 junepartner. All rights reserved.
//

#import "JPFileUtility.h"

@implementation JPFileUtility

/**
 获取Tmp路径
 @returns Tmp路径
 */
+ (NSString*)getTmpDirectory
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
}

/**
 获取Library路径
 @returns Library路径
 */
+ (NSString*)getLibraryDirectory
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
}

/**
 获取Documents路径
 @returns Documents路径
 */
+ (NSString*)getDocumentsDirectory
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

/**
 生成文件路径
 @param directory 文件目录
 @param fileName  文件名
 @returns 文件路径
 */
+ (NSString*)getPathByDirectory:(NSString *)directory
                    andFileName:(NSString *)fileName
{
    NSString *pathDirectory = [JPFileUtility getDocumentsDirectory];
    if ([directory isEqualToString:@"tmp"]) {
        pathDirectory = [JPFileUtility getTmpDirectory];
    }
    NSString* fileDirectory = [pathDirectory stringByAppendingPathComponent:fileName];
    return fileDirectory;
}

/**
 创建文件夹
 @param rootName        文件夹目录
 @param directoryName   文件夹名
 @returns 文件夹路径
 */
+ (NSString *)createDirectoryPathWithRoot:(NSString *)rootName
                         andDirectoryName:(NSString *)directoryName
{
    NSString *pathDirectory = [JPFileUtility getDocumentsDirectory];
    if ([rootName isEqualToString:@"tmp"]) {
        pathDirectory = [JPFileUtility getTmpDirectory];
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    directoryName = [NSString stringWithFormat:@"%@", directoryName];
    NSString *directoryPath = [pathDirectory stringByAppendingPathComponent:directoryName];
    
    BOOL isDirectory = NO;
    BOOL isDirectoryExist = [fileManager fileExistsAtPath:directoryPath
                                              isDirectory:&isDirectory];
    
    if (!(isDirectory && isDirectoryExist)) {
        BOOL result = [fileManager createDirectoryAtPath:directoryPath
                             withIntermediateDirectories:YES
                                              attributes:nil
                                                   error:nil];
        if (result) {
            NSLog(@"文件夹创建成功");
        } else {
            NSLog(@"文件夹创建失败");
        }
    }
    return directoryPath;
}

/**
 判断文件是否存在
 @param path 文件路径
 @returns 存在返回yes
 */
+ (BOOL)fileExistsAtPath:(NSString*)path
{
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

/**
 删除文件
 @param path 文件路径
 @returns 成功返回yes
 */
+ (BOOL)deleteFileAtPath:(NSString*)path
{
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

@end