//
//  BZControllerSingleton.h
//  BZNaviCtrl
//
//  Created by WangPan on 2017/4/19.
//  Copyright © 2017 bezing@live.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BZControllerSingleton : NSObject

@property (nonatomic, weak) id popA;

@property (nonatomic, weak) id popB;

@property (nonatomic, weak) id popP;

+(BZControllerSingleton *)shareInstance;

@end
