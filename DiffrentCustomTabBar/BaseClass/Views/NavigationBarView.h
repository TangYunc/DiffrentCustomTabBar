//
//  NavigationBarView.h
//  DiffrentCustomTabBar
//
//  Created by tangyunchuan on 2018/8/8.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationBarView : UIView

@property (weak,nonatomic)UIViewController *viewController;

@property (nonatomic ,assign) NSString *title;
//左侧返回
- (instancetype)initWithFrame:(CGRect)frame andLeftBtn:(NSString *)title;

//右侧返回
- (instancetype)initWithFrame:(CGRect)frame andRightBtn:(NSString *)title;

//无返回
- (instancetype)initWithFrame:(CGRect)frame andtitle:(NSString *)title;

@end
