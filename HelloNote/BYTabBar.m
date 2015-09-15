//
//  BYTabBar.m
//  HelloNote
//
//  Created by binglogo on 15/9/15.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "BYTabBar.h"

@interface BYTabBar ()

@property (nonatomic, weak) UIButton *postButton;

@end

@implementation BYTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 添加TabBar中间按钮
        UIButton *postButton = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置按钮的不同状态
        [postButton setImage:[UIImage imageNamed:@"cameratool-on"] forState:UIControlStateNormal];
        [postButton setImage:[UIImage imageNamed:@"cameratool-down"] forState:UIControlStateHighlighted];
        [postButton setImage:[UIImage imageNamed:@"cameratool-off"] forState:UIControlStateSelected];
        [postButton setBackgroundImage:[UIImage imageNamed:@"bg_joblist_search"] forState:UIControlStateNormal];
        
        CGFloat btnW = postButton.currentImage.size.width + 8;
        CGFloat btnH = postButton.currentImage.size.height + 8;
        postButton.frame = CGRectMake(0, 0, btnW, btnH);
        
        [postButton addTarget:self action:@selector(postButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:postButton];
        self.postButton = postButton;
    }
    return self;
}

- (void)postButtonClicked:(UIButton *)sender {
    if ([self.postButtonDelegate respondsToSelector:@selector(postButtonClickedOnTabBar:)]) {
        [self.postButtonDelegate postButtonClickedOnTabBar:self];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat btnCenterX = self.frame.size.width * 0.5;
    CGFloat btnCenterY = self.frame.size.height * 0.5;
    self.postButton.center = CGPointMake(btnCenterX, btnCenterY);
    
    int tabBarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        
        if (tabBarButtonIndex == 1) {
            tabBarButtonIndex++;
        }

        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            CGFloat childW = self.frame.size.width / (self.subviews.count - 2);
            CGFloat childH = child.frame.size.height;
            CGFloat childX = tabBarButtonIndex * childW;
            CGFloat childY = child.frame.origin.y;
            child.frame = CGRectMake(childX, childY, childW, childH);
            tabBarButtonIndex++;
        }
    }
}

@end
