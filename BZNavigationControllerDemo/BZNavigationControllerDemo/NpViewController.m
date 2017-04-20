//
//  NpViewController.m
//  BZNaviCtrl
//
//  Created by WangPan on 2017/4/19.
//  Copyright © 2017 bezing@live.com. All rights reserved.
//

#import "NpViewController.h"

@interface NpViewController ()

@end

@implementation NpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"red"] forBarMetrics:UIBarMetricsDefault];
    
    if (self.bzNavigationController.viewControllers.count == 2) {
        self.title = @"PopPVC";
        [BZControllerSingleton shareInstance].popP = self;
    }

}

- (void)clickPushButton{
    NpViewController * nvc = [[NpViewController alloc] init];
    nvc.bzPanBackGestureDisable = YES;
    nvc.labelString = @"PanBackGestureDisable";
    [self.bzNavigationController pushViewController:nvc animated:YES];
}

- (void)clickPopRootButton{
    [self.bzNavigationController popToRootViewControllerAnimated:YES];
}

- (void)clickPopToButton{
    NpViewController * pvc = [BZControllerSingleton shareInstance].popP;
    [self.bzNavigationController popToViewController:pvc animated:YES];
}
@end
