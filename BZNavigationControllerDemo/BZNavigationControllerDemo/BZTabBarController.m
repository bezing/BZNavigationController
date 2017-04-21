//
//  BZTabBarController.m
//  BZNaviCtrl
//
//  Created by WangPan on 2017/4/19.
//  Copyright © 2017 bezing@live.com. All rights reserved.
//

#import "BZTabBarController.h"
#import "BaseViewController.h"

@interface BZTabBarController ()

@end

@implementation BZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BaseViewController * va = [[BaseViewController alloc] init];
    UITabBarItem * itema = [[UITabBarItem alloc] initWithTitle:@"Nomal" image:[UIImage imageNamed:@"tab_my_s"] selectedImage:[UIImage imageNamed:@"tab_my_us"]];
    va.tabBarItem = itema;
    BZNavigationController *nva = [[BZNavigationController alloc] initWithRootViewController:va];
    [self addChildViewController:nva];
    
    BaseViewController * vb = [[BaseViewController alloc] init];
    UITabBarItem * itemb = [[UITabBarItem alloc] initWithTitle:@"FullScreen" image:[UIImage imageNamed:@"tab_my_s"] selectedImage:[UIImage imageNamed:@"tab_my_us"]];
    vb.tabBarItem = itemb;
    BZNavigationController *nvb = [[BZNavigationController alloc] initWithRootViewController:vb];
    [self addChildViewController:nvb];
    
    BaseViewController * vc = [[BaseViewController alloc] init];
    UITabBarItem * itemc = [[UITabBarItem alloc] initWithTitle:@"PGDisable" image:[UIImage imageNamed:@"tab_my_s"] selectedImage:[UIImage imageNamed:@"tab_my_us"]];
    vc.tabBarItem = itemc;
    BZNavigationController *nvc = [[BZNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nvc];
}



@end
