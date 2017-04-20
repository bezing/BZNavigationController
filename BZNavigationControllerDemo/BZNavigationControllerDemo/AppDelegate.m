//
//  AppDelegate.m
//  BZNavigationControllerDemo
//
//  Created by bezing on 2017/4/20.
//  Copyright © 2017年 bezing@live.com. All rights reserved.
//


#import "AppDelegate.h"
#import "BZTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    BZTabBarController * bztb = [[BZTabBarController alloc] init];
    BZNavigationController * bznv = [[BZNavigationController alloc] initWithRootViewController:bztb];
    self.window.rootViewController = bznv;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
