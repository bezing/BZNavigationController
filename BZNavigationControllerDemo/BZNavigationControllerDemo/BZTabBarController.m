//
//  BZTabBarController.m
//  BZNaviCtrl
//
//  Created by WangPan on 2017/4/19.
//  Copyright © 2017 bezing@live.com. All rights reserved.
//

#import "BZTabBarController.h"
#import "NaViewController.h"
#import "NbViewController.h"
#import "NpViewController.h"

@interface BZTabBarController ()

@end

@implementation BZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    NaViewController * va = [[NaViewController alloc] init];
    va.labelString = @"Normal";
    UITabBarItem * itema = [[UITabBarItem alloc] initWithTitle:@"Nomal" image:[UIImage imageNamed:@"tab_my_s"] selectedImage:[UIImage imageNamed:@"tab_my_us"]];
    va.tabBarItem = itema;
    BZNavigationController *nva = [[BZNavigationController alloc] initWithRootViewController:va];
    [self addChildViewController:nva];
    
    NbViewController * vb = [[NbViewController alloc] init];
    vb.labelString = @"HiddenTabBar";
    UITabBarItem * itemb = [[UITabBarItem alloc] initWithTitle:@"NoBar" image:[UIImage imageNamed:@"tab_my_s"] selectedImage:[UIImage imageNamed:@"tab_my_us"]];
    vb.tabBarItem = itemb;
    BZNavigationController *nvb = [[BZNavigationController alloc] initWithRootViewController:vb];
    [self addChildViewController:nvb];
    
    NpViewController * vc = [[NpViewController alloc] init];
    vc.labelString = @"PanBackGestureDisable";
    UITabBarItem * itemc = [[UITabBarItem alloc] initWithTitle:@"NoGR" image:[UIImage imageNamed:@"tab_my_s"] selectedImage:[UIImage imageNamed:@"tab_my_us"]];
    vc.tabBarItem = itemc;
    BZNavigationController *nvc = [[BZNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nvc];
}



@end
