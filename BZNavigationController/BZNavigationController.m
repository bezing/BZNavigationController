//
//  BZNavigationController.m
//  BZNaviCtrl
//
//  Created by WangPan on 2017/4/19.
//  Copyright © 2017 bezing@live.com. All rights reserved.
//

#import "BZNavigationController.h"
#import <objc/runtime.h>

@interface BZNavigationController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation BZNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super init];
    if (self) {
        BZWrapViewController * bzwvc = [[BZWrapViewController alloc] initWrapWithController:rootViewController];
        rootViewController.bzNavigationController = self;
        self.viewControllers = @[bzwvc];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    self.delegate = weakSelf;
    self.interactivePopGestureRecognizer.delegate = weakSelf;
    [self setNavigationBarHidden:YES animated:NO];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (animated) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    BZWrapViewController * bzwvc = [[BZWrapViewController alloc] initWrapWithController:viewController];
    viewController.bzNavigationController = self;
    [super pushViewController:bzwvc animated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.interactivePopGestureRecognizer.enabled = NO;
    BZWrapViewController * wrap = nil;
    for (BZWrapViewController *wrapCtrl in self.viewControllers) {
        if ([viewController isEqual:wrapCtrl.basicController]) {
            wrap = wrapCtrl;
            break;
        }
    }
    if (!wrap) {
        return [NSArray array];
    }
    return [super popToViewController:wrap animated:animated];
}


- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    if (animated) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return [super popToRootViewControllerAnimated:animated];
}


- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.interactivePopGestureRecognizer.enabled = YES;
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.visibleViewController.bzPanBackGestureDisable) {
        return NO;
    }else if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        if (self.viewControllers.count < 2 || self.visibleViewController == self.viewControllers.firstObject) {
            return NO;
        }
    }
    return YES;
}

@end


//
@implementation BZWrapNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     custom default...
     */
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"red"] forBarMetrics:UIBarMetricsDefault];
//    self.navigationBar.shadowImage = [UIImage new];
}

@end

//
@implementation BZWrapViewController

- (instancetype)initWrapWithController:(UIViewController *)controller{
    self = [super init];
    if (self) {
        BZWrapNavigationController *wrapNavi = [[BZWrapNavigationController alloc] initWithRootViewController:controller];
        self.basicController = controller;
        // if UITabBarController
        if ([controller isKindOfClass:[UITabBarController class]]) {
            [wrapNavi setNavigationBarHidden:YES animated:NO];
        }
        [self.view addSubview:wrapNavi.view];
        [self addChildViewController:wrapNavi];
    }
    return self;
}

// custom add connection property

- (BOOL)bzPanBackGestureDisable{
    return self.basicController.bzPanBackGestureDisable;
}

- (UITabBarItem *)tabBarItem{
    return self.basicController.tabBarItem;
}

- (BOOL)hidesBottomBarWhenPushed {
    return self.basicController.hidesBottomBarWhenPushed;
}

- (UITabBarController*)tabBarController{
    return self.basicController.tabBarController;
}
@end


//
@implementation UIViewController (BZExtension)

- (BOOL)bzPanBackGestureDisable{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setBzPanBackGestureDisable:(BOOL)panBackGestureDisable{
    objc_setAssociatedObject(self, @selector(bzPanBackGestureDisable), @(panBackGestureDisable), OBJC_ASSOCIATION_ASSIGN);
}

- (BZNavigationController *)bzNavigationController {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBzNavigationController:(BZNavigationController *)navigationController {
    objc_setAssociatedObject(self, @selector(bzNavigationController), navigationController, OBJC_ASSOCIATION_ASSIGN);
}

@end
