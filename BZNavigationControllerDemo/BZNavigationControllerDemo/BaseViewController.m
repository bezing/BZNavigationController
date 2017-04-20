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

    [self aboutUI];
}

- (void)backClick{
    [self.bzNavigationController popViewControllerAnimated:YES];
}
- (void)clickPushButton{
}
- (void)clickPopToButton{
}
- (void)clickPopRootButton{
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
        UIButton * back=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 14, 24)];
        [back setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    }
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, self.view.bounds.size.width -  200, 40)];
    label.text = self.labelString;
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    
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
