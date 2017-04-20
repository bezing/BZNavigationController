//
//  BZControllerSingleton.m
//  BZNaviCtrl
//
//  Created by WangPan on 2017/4/19.
//  Copyright © 2017 bezing@live.com. All rights reserved.
//

#import "BZControllerSingleton.h"
static BZControllerSingleton * singleton;

@implementation BZControllerSingleton

+ (BZControllerSingleton*)shareInstance{
    if (!singleton) {
        singleton = [[BZControllerSingleton alloc] init];
    }
    return singleton;
}

@end
