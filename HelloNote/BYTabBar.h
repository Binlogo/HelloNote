//
//  BYTabBar.h
//  HelloNote
//
//  Created by binglogo on 15/9/15.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BYTabBar;

@protocol BYTabBarDelegate <NSObject>

@optional

- (void)postButtonClickedOnTabBar:(BYTabBar *)tabBar;

@end

@interface BYTabBar : UITabBar

@property (nonatomic, weak) id<BYTabBarDelegate> postButtonDelegate;

@end
