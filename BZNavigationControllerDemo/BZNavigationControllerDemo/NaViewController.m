//
//  NaViewController.m
//  BZNaviCtrl
//
//  Created by WangPan on 2017/4/19.
//  Copyright © 2017 bezing@live.com. All rights reserved.
//

#import "NaViewController.h"

@interface NaViewController ()

@end

@implementation NaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.bzNavigationController.viewControllers.count == 2) {
        self.title = @"PopAVC";
        [BZControllerSingleton shareInstance].popA = self;
    }

}

- (void)clickPushButton{
    NaViewController * nvc = [[NaViewController alloc] init];
    nvc.labelString = @"Normal";
    [self.bzNavigationController pushViewController:nvc animated:YES];
}

- (void)clickPopRootButton{
    [self.bzNavigationController popToRootViewControllerAnimated:YES];
}

- (void)clickPopToButton{
    NaViewController * pvc = [BZControllerSingleton shareInstance].popA;
    [self.bzNavigationController popToViewController:pvc animated:YES];
}
@end
