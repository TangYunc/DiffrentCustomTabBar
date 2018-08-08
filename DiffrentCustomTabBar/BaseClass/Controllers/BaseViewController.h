//
//  BaseViewController.h
//  DiffrentCustomTabBar
//
//  Created by tangyunchuan on 2018/8/8.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/** 导航条View */
@property (nonatomic, strong) UIView *navBarView;

@property (nonatomic, assign) BOOL isBackButton;
- (void)hideNavigationBarShadowLine:(BOOL)hide;
-(void)setNavigationBarTitle:(NSString *)title;
- (void)popdAlertViewIsAlertStyleWithTitle:(NSString *)title withMessage:(NSString *)message;
- (void)popdAlertViewIsActionSheetStyleWithTitle:(NSString *)title withMessage:(NSString *)message;
@end
