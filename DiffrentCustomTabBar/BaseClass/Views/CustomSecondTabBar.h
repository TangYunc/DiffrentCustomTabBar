//
//  CustomSecondTabBar.h
//  DiffrentCustomTabBar
//
//  Created by tangyunchuan on 2018/8/8.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomSecondTabBar;

@protocol CustomSecondTabBarDelegate <NSObject>

-(void)tabBar:(CustomSecondTabBar *)tabBar from:(NSInteger)from to:(NSInteger)to;
-(void)tabBarPresentViewController:(CustomSecondTabBar *)tabBar;
-(void)selectTabItem:(NSInteger)index;
- (void)tabBarPlusBtnClick:(CustomSecondTabBar *)tabBar;

@end

@interface CustomSecondTabBar : UIView

@property (nonatomic, weak) id <CustomSecondTabBarDelegate> delegate;

-(void)addTabBarButton:(UITabBarItem *)item;
-(void)selectTabItem:(NSInteger)index;

@end
