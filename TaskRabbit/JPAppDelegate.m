//
//  JPAppDelegate.m
//  TaskRabbit
//
//  Created by ShiXiong on 14-6-30.
//  Copyright (c) 2014年 junepartner. All rights reserved.
//

#import "JPAppDelegate.h"
#import "JPMoreViewController.h"
#import "JPMenuViewController.h"
#import "JPAnnounceViewController.h"
#import "JPNearByViewController.h"
#import "JPTaskViewController.h"

#define kSideViewControllerWidth 220

@implementation JPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    JPMenuViewController *menuViewController = [[JPMenuViewController alloc] init];
    JPAnnounceViewController *announceViewController = [[JPAnnounceViewController alloc] init];
    JPNearByViewController *nearByViewController = [[JPNearByViewController alloc] init];
    JPTaskViewController *taskViewController = [[JPTaskViewController alloc] init];
    
    UINavigationController *announceNav = [[UINavigationController alloc] initWithRootViewController:announceViewController];
    UINavigationController *nearByNav = [[UINavigationController alloc] initWithRootViewController:nearByViewController];
    UINavigationController *taskNav = [[UINavigationController alloc] initWithRootViewController:taskViewController];
    
    menuViewController.viewControllers = @[announceNav, nearByNav, taskNav];
    
    JPMoreViewController *moreViewController = [[JPMoreViewController alloc] init];
    JPSlideViewController *sideViewController = [[JPSlideViewController alloc] init];
    sideViewController.rootViewController = menuViewController;
    sideViewController.leftViewController = moreViewController;
    sideViewController.leftViewShowWidth = kSideViewControllerWidth;
    sideViewController.needSwipeShowMenu = YES;
    [sideViewController setRootViewMoveBlock:^(UIView *rootView, CGRect orginFrame, CGFloat xoffset) {
        rootView.frame = CGRectMake(xoffset, orginFrame.origin.y, orginFrame.size.width, orginFrame.size.height);
    }];
    self.sideViewController = sideViewController;
    self.window.rootViewController = self.sideViewController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end