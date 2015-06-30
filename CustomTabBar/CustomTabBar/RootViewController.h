//
//  RootViewController.h
//  CustomTabBar
//
//  Created by qianfeng on 14-8-30.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
 //按钮的类型
#define ADD @"add"
#define CLEAR @"clear"
#define GROUP @"group"
#define MORE @"more"

@interface RootViewController : UIViewController

- (void)createNavigationBarWithLeftType:(NSString *)leftType andRightType:(NSString *)rightType;

- (void)rightButtonPressed:(UIButton *)button;

- (void)leftButtonPressed:(UIButton *)button;

@end
