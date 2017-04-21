//
//  BaseViewController.m
//  BZNaviCtrl
//
//  Created by WangPan on 2017/4/19.
//  Copyright © 2017 bezing@live.com. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self.navigationController.navigationBar setBarTintColor:randomColor];
    
    if (self.tabBarController.selectedIndex == 1 && self.bzNavigationController.childViewControllers.count > 1) {
        /*
         导航栏透明+hidesBottomBarWhenPushed实现FullScreen
         */
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        self.view.backgroundColor = randomColor;
    }
    
    [self aboutUI];
    [self popToViewLogic];
}

- (void)clickPushButton{
    switch (self.tabBarController.selectedIndex) {
        case 0:
        {
            BaseViewController * bvc = [[BaseViewController alloc] init];
            [self.bzNavigationController pushViewController:bvc animated:YES];
        }
            break;
        case 1:
        {
            BaseViewController * bvc = [[BaseViewController alloc] init];
            /**
             隐藏tabbar
             **/
            bvc.hidesBottomBarWhenPushed = YES;
            [self.bzNavigationController pushViewController:bvc animated:YES];
        }
            break;
        case 2:
        {
            BaseViewController * bvc = [[BaseViewController alloc] init];
            /**
             禁用返回手势
             **/
            bvc.bzPanBackGestureDisable = YES;
            [self.bzNavigationController pushViewController:bvc animated:YES];
        }
            break;
        default:
            break;
    }
    
}

- (void)backClick{
    [self.bzNavigationController popViewControllerAnimated:YES];
}

- (void)clickPopToButton{
    BaseViewController * bvc;
    switch (self.tabBarController.selectedIndex) {
        case 0:
            bvc = [BZControllerSingleton shareInstance].popA;
            break;
        case 1:
            bvc = [BZControllerSingleton shareInstance].popB;
            break;
        case 2:
            bvc = [BZControllerSingleton shareInstance].popP;
            break;
        default:
            break;
    }
    [self.bzNavigationController popToViewController:bvc animated:YES];
}
- (void)clickPopRootButton{
    [self.bzNavigationController popToRootViewControllerAnimated:YES];
}











- (void)popToViewLogic{
    switch (self.tabBarController.selectedIndex) {
        case 0:
            if (self.bzNavigationController.viewControllers.count == 2) {
                self.title = @"PopAVC";
                [BZControllerSingleton shareInstance].popA = self;
            }else{
                self.title = @"Normal";
            }
            break;
        case 1:
            if (self.bzNavigationController.viewControllers.count == 2) {
                self.title = @"PopBVC";
                [BZControllerSingleton shareInstance].popB = self;
            }else{
                self.title = @"FullScreen";
            }
            break;
        case 2:
            if (self.bzNavigationController.viewControllers.count == 2) {
                self.title = @"PopPVC";
                [BZControllerSingleton shareInstance].popP = self;
            }else{
                self.title = @"PGDisable";
            }
            break;
        default:
            break;
    }
}

- (void)buttonClick:(UIButton *)sender{
    switch (sender.tag) {
        case 101:
            [self clickPushButton];
            break;
        case 102:
            [self clickPopToButton];
            break;
        case 103:
            [self clickPopRootButton];
            break;
        default:
            break;
    }
}

- (void)aboutUI {
    
    if (self.bzNavigationController.viewControllers.count > 1) {
        UIButton * back=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [back setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    }
    
    [self buttonWithTitle:@"PushToNewVC" andOffsetY:200 tag:101];
    [self buttonWithTitle:@"PopToPopVC"    andOffsetY:300 tag:102];
    [self buttonWithTitle:@"PopToRootVC"   andOffsetY:400 tag:103];
    
}

- (void)buttonWithTitle:(NSString*)title andOffsetY:(CGFloat)offsetY tag:(NSInteger)tag{
    UIButton * pushButton = [[UIButton alloc] initWithFrame:CGRectMake(100, offsetY, self.view.bounds.size.width-200,60)];
    pushButton.backgroundColor = [UIColor colorWithWhite:0.6 alpha:1];
    pushButton.titleLabel.font = [UIFont systemFontOfSize:14];
    pushButton.tag = tag;
    [pushButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [pushButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pushButton setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:pushButton];
    
    if (self.bzNavigationController.viewControllers.count <= 2 && tag == 102) {
        pushButton.enabled = NO;
        pushButton.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    }
}

@end
