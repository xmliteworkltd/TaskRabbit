//
//  JPMenuViewController.h
//  TaskRabbit
//
//  Created by xiangming on 14-7-2.
//  Copyright (c) 2014年 JunePartner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JPMainTabBarView.h"

@interface JPMenuViewController : UITabBarController <JPMainTabBarViewDelegate>

@property (nonatomic, strong) JPMainTabBarView *mainTabBar;

@end
