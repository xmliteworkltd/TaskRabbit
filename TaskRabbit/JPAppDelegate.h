//
//  JPAppDelegate.h
//  TaskRabbit
//
//  Created by xiangming on 14-7-2.
//  Copyright (c) 2014年 JunePartner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPSlideViewController.h"


@interface JPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) JPSlideViewController *sideViewController;

@end