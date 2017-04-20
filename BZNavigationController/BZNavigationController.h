//
//  BZNavigationController.h
//  BZNaviCtrl
//
//  Created by WangPan on 2017/4/19.
//  Copyright © 2017 bezing@live.com. All rights reserved.
//


#import <UIKit/UIKit.h>

//
@interface BZNavigationController : UINavigationController

@end


//
@interface BZWrapNavigationController : UINavigationController

@end


//
@interface BZWrapViewController : UIViewController

@property (nonatomic, strong) UIViewController * basicController;

- (instancetype)initWrapWithController:(UIViewController *)controller;

@end

//
@interface UIViewController (BZExtension)

@property (nonatomic, assign) BOOL bzPanBackGestureDisable;

@property (nonatomic, weak) BZNavigationController *bzNavigationController;

@end
