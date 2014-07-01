//
//  JPSlideViewController.h
//  TaskRabbit
//
//  Created by ShiXiong on 14-6-30.
//  Copyright (c) 2014年 junepartner. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RootViewMoveBlock)(UIView *rootView, CGRect orginFrame, CGFloat xoffset);

@interface JPSlideViewController : UIViewController

@property (assign,nonatomic) BOOL needSwipeShowMenu;                            //是否开启手势滑动出菜单

@property (retain,nonatomic) UIViewController *rootViewController;
@property (retain,nonatomic) UIViewController *leftViewController NS_AVAILABLE_IOS(5_0);
@property (retain,nonatomic) UIViewController *rightViewController NS_AVAILABLE_IOS(5_0);

@property (assign,nonatomic) CGFloat leftViewShowWidth;                         //左侧栏的展示大小
@property (assign,nonatomic) CGFloat rightViewShowWidth;                        //右侧栏的展示大小

@property (assign,nonatomic) NSTimeInterval animationDuration;                  //动画时长
@property (assign,nonatomic) BOOL showBoundsShadow;                             //是否显示边框阴影

@property (copy,nonatomic) RootViewMoveBlock rootViewMoveBlock;                 //可在此block中重做动画效果

- (void)setRootViewMoveBlock:(RootViewMoveBlock)rootViewMoveBlock;
- (void)showLeftViewController:(BOOL)animated;              //展示左边栏
- (void)showRightViewController:(BOOL)animated;             //展示右边栏
- (void)hideSideViewController:(BOOL)animated;              //恢复正常位置

@end