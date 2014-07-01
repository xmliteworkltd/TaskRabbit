//
//  JPMainTabBarView.h
//  TaskRabbit
//
//  Created by xiangming on 14-7-2.
//  Copyright (c) 2014年 JunePartner. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JPMainTabBarViewDelegate;

@interface JPMainTabBarView : UIView {
	UIImageView *_backgroundView;
	NSMutableArray *_buttons;
}

@property (nonatomic, retain) UIImageView *backgroundView;
@property (nonatomic, assign) id<JPMainTabBarViewDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *buttons;

- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray;
- (void)selectTabAtIndex:(NSInteger)index;
- (void)removeTabAtIndex:(NSInteger)index;
- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;
- (void)setBackgroundImage:(UIImage *)img;

@end

@protocol JPMainTabBarViewDelegate <NSObject>

@optional
- (void)tabBar:(JPMainTabBarView *)tabBar didSelectIndex:(NSInteger)index;


@end
