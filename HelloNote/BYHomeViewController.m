//
//  BYThreeViewController.m
//  经典UI框架
//
//  Created by binglogo on 15/9/10.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "BYHomeViewController.h"
#import "BYNavItem.h"

@interface BYHomeViewController ()
/**
 *  笔记本数组
 */
@property (nonatomic, strong) NSMutableArray *notebooksArray;

@end

@implementation BYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)setupNavigationBar {
    self.navigationItem.leftBarButtonItem = [BYNavItem navItemWithTarget:self action:@selector(userInformation) image:@"icon_setting_nor" selectedImage:@"icon_setting_pre"];
    self.navigationItem.rightBarButtonItem = [BYNavItem navItemWithTarget:self action:@selector(more) image:@"navigationbar_more" selectedImage:@"navigationbar_more_highlighted"];
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)userInformation {
    
}

- (void)more {
    
}

@end
