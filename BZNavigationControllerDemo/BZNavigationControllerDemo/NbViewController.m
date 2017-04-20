//
//  NbViewController.m
//  BZNaviCtrl
//
//  Created by WangPan on 2017/4/19.
//  Copyright © 2017 bezing@live.com. All rights reserved.
//

#import "NbViewController.h"

@interface NbViewController ()

@end

@implementation NbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    if (self.bzNavigationController.viewControllers.count == 2) {
        self.title = @"PopBVC";
        [BZControllerSingleton shareInstance].popB = self;
    }

}
- (void)clickPushButton{
    NbViewController * nvc = [[NbViewController alloc] init];
    nvc.labelString = @"HiddenTabBar";
    nvc.hidesBottomBarWhenPushed = YES;
    [self.bzNavigationController pushViewController:nvc animated:YES];
}

- (void)clickPopRootButton{
    [self.bzNavigationController popToRootViewControllerAnimated:YES];
}

- (void)clickPopToButton{
    NbViewController * pvc = [BZControllerSingleton shareInstance].popB;
    [self.bzNavigationController popToViewController:pvc animated:YES];
}
@end
