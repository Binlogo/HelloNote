//
//  BYTabBarViewController.m
//  HelloNote
//
//  Created by binglogo on 15/9/15.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "BYTabBarViewController.h"
#import "BYHomeViewController.h"
#import "BYPopularViewController.h"
#import "BYNavigationController.h"
#import "BYTabBar.h"

@interface BYTabBarViewController () <BYTabBarDelegate,UITabBarDelegate>

@end

@implementation BYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadMainFrame];
}

#pragma mark - Custom Methods

- (void)loadMainFrame {
    
    // 定制TabBar
    BYTabBar *tabBar = [[BYTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    tabBar.postButtonDelegate = self;
    
    // 创建TabBar模块的控制器，并设置TabBarItem状态图片和title
    
    BYHomeViewController *homeViewController = [[BYHomeViewController alloc] init];
    homeViewController.title = @"主页";
    [self addChildVCWithChildVC:homeViewController image:@"icon_home_nor" selectedImage:@"icon_home_pre"];
    
    BYPopularViewController *popularViewController = [[BYPopularViewController alloc] init];
    popularViewController.title = @"人气榜";
    [self addChildVCWithChildVC:popularViewController image:@"icon_find_nor" selectedImage:@"icon_find_pre"];
    
}

- (void)addChildVCWithChildVC:(UIViewController *)childVC image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置两种状态下的图片，特别是选中时图片不能被系统渲染成蓝色，要保持原来的橙色
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置两种状态下的文字样式
    NSMutableDictionary *normalTextAttrs = [[NSMutableDictionary alloc] init];
    normalTextAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [childVC.tabBarItem setTitleTextAttributes:normalTextAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedTextAttrs = [[NSMutableDictionary alloc] init];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:64/255.0 green:148/255.0 blue:113/255.0 alpha:1.0];
    [childVC.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    //每个模块都是各自导航控制器的根控制器
    BYNavigationController *nav = [[BYNavigationController alloc] initWithRootViewController:childVC];
    //添加每个nav控制器至tabBarVC
    [self addChildViewController:nav];
}

#pragma mark TabBarDelegate Methods

- (void)postButtonClickedOnTabBar:(BYTabBar *)tabBar {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
