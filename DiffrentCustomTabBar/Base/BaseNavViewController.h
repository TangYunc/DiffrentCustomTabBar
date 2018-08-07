//
//  BaseNavViewController.h
//  DiffrentCustomTabBar
//
//  Created by tangyunchuan on 2018/8/7.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavViewController : UIViewController

/**
 *  设置导航栏样式，子类可以复写该方法设置自己导航栏样式
 */
- (void)setUpNavStyle;

- (UIBarButtonItem *)leftNavigationItem;
- (UIBarButtonItem *)rightNavigationItem;
@end
