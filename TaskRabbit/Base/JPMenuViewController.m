//
//  JPMenuViewController.m
//  TaskRabbit
//
//  Created by xiangming on 14-7-2.
//  Copyright (c) 2014年 JunePartner. All rights reserved.
//

#import "JPMenuViewController.h"

@interface JPMenuViewController ()

@end

@implementation JPMenuViewController

@synthesize mainTabBar = _mainTabBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
   self.tabBar.hidden = YES;
    self.hidesBottomBarWhenPushed = YES;
    
    [self initCustomTabBar];
}

- (void)initCustomTabBar
{
    NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic setObject:[UIImage imageNamed:@"001_1"] forKey:@"Default"];
	[imgDic setObject:[UIImage imageNamed:@"001"] forKey:@"Highlighted"];
	[imgDic setObject:[UIImage imageNamed:@"001"] forKey:@"Seleted"];
    
	NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic2 setObject:[UIImage imageNamed:@"002_2"] forKey:@"Default"];
	[imgDic2 setObject:[UIImage imageNamed:@"002"] forKey:@"Highlighted"];
	[imgDic2 setObject:[UIImage imageNamed:@"002"] forKey:@"Seleted"];
    
	NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic3 setObject:[UIImage imageNamed:@"003_3"] forKey:@"Default"];
	[imgDic3 setObject:[UIImage imageNamed:@"003"] forKey:@"Highlighted"];
	[imgDic3 setObject:[UIImage imageNamed:@"003"] forKey:@"Seleted"];
	
	NSArray *imgArr = [NSArray arrayWithObjects:imgDic,imgDic2,imgDic3,nil];
    
    CGRect frame = CGRectMake(0, kHeight - kTabBarHeight, kWidth, kTabBarHeight);
    if (Version < 7.0) {
        frame = CGRectMake(0, kHeight - kTabBarHeight - KStateBarHeight, kWidth, kTabBarHeight);
    }
    _mainTabBar = [[JPMainTabBarView alloc] initWithFrame:frame buttonImages:imgArr];
    _mainTabBar.delegate = self;
    [_mainTabBar setBackgroundImage:[UIImage imageNamed:@"c-2-1"]];
    _mainTabBar.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_mainTabBar];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if (Version >= 7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - JPMainTabBarViewDelegate
- (void)tabBar:(JPMainTabBarView *)tabBar didSelectIndex:(NSInteger)index
{
    self.selectedIndex = index;
}

@end
