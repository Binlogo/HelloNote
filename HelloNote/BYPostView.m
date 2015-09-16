//
//  BYPostView.m
//  HelloNote
//
//  Created by binglogo on 15/9/15.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "BYPostView.h"

@interface BYPostView ()

@property (nonatomic, strong) UIButton *textPostBtn;

@end

@implementation BYPostView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addPostOptionButtons];
    }
    return self;
}

//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGFloat frameW = [UIScreen mainScreen].bounds.size.width * 0.6;
//    CGFloat frameH = [UIScreen mainScreen].bounds.size.height * 0.2;
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, frameW, frameH) cornerRadius:10];
//    CGContextAddPath(context, path.CGPath);
//    CGContextSetFillColor(context, CGColorGetComponents([UIColor lightGrayColor].CGColor));
//    CGContextFillPath(context);
//}

- (void)addPostOptionButtons {
    UIButton *textPostBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [textPostBtn setImage:[UIImage imageNamed:@"cameratool-on"] forState:UIControlStateNormal];
    [textPostBtn setBackgroundImage:[UIImage imageNamed:@"bg_joblist_search"] forState:UIControlStateNormal];
    [textPostBtn setImage:[UIImage imageNamed:@"cameratool-down"] forState:UIControlStateHighlighted];
    [textPostBtn addTarget:self action:@selector(postText:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:textPostBtn];
}

- (void)postText:(UIButton *)sender {
    
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat frameW = [UIScreen mainScreen].bounds.size.width * 0.6;
    CGFloat frameH = [UIScreen mainScreen].bounds.size.height * 0.2;
    self.frame = CGRectMake(0, 0, frameW, frameH);
    CGFloat centerX = [UIScreen mainScreen].bounds.size.width * 0.5;
    CGFloat centerY = [UIScreen mainScreen].bounds.size.height - 120;
    self.center = CGPointMake(centerX, centerY);
    self.backgroundColor = [UIColor colorWithRed:64/255.0 green:148/255.0 blue:113/255.0 alpha:0.6];
}

@end
